class CartController < ApplicationController
  def index
    respond_to do |format|
      format.html { render }
      format.js { render layout: false }
    end
  end

  def add_item
    @cart.add_item(params[:id])

    render json: true
  end

  def remove_item
    @cart.remove_item(params[:id])

    redirect_to cart_path
  end

  def empty
    @cart.empty

    render json: { }
  end

  def checkout
    order = Order.create(
      total:          @cart.total,
      shipping_price: @cart.shipping_price,
      status:         'pending',
      currency:       current_currency,
      currency_rate:  current_currency_rate,
      token:          SecureRandom.urlsafe_base64
    )

    @cart.items.each do |cart_item|
      order.order_items.create(item_id: cart_item.item.id, quantity: cart_item.quantity, price: (cart_item.item.price * order.currency_rate).round(CoingateService::CRYPTO_CURRENCIES.include?(order.currency) ? 6 : 2))
    end

    session[:current_order] = order.id

    @cart.empty

    response = coingate_client.create_order(
      order_id:             "ORDER-#{(Time.now.to_f * 1e6).to_i}-#{order.id}",
      price_amount:         order.total,
      price_currency:       order.currency,
      receive_currency:     current_receive_currency,
      title:                "Order ##{order.id}",
      description:          order.description,
      callback_url:         payments_notify_url(token: order.token),
      success_url:          payments_success_url,
      cancel_url:           root_url,
      success_auto_return:  1
    )

    if response.success?
      order.update_attributes(coingate_id: response.response[:id], coingate_status: response.response[:status])

      redirect_to response.response[:payment_url]
    else
      order.update_attribute(:status, 'failure')
      order.order_failures.create(http_status: response.http_code, reason: response.reason, message: response.response)

      redirect_to order_path(order.id), flash: { error: 'Ooops! Something wrong. Please try again or contact with support' }
    end
  end
end