class CartSession
  def initialize(session)
    @session = session
    @session[:cart] ||= {}
  end

  def add_item(item_id)
    @session[:cart][item_id].present? ? @session[:cart][item_id] += 1 : @session[:cart][item_id] = 1
  end

  def remove_item(item_id)
    @session[:cart].delete(item_id)
  end

  def items
    Item.where(id: @session[:cart].keys).each_with_object([]) do |item, a|
      a << OpenStruct.new(
        item:         item,
        quantity:     @session[:cart][item.id.to_s],
        total_price:  ((item.price * @session[:cart][item.id.to_s]) * @session[:currency_rate]).round(2)
      )
    end
  end

  def subtotal
    items.any? ? items.sum(&:total_price) : 0
  end

  def total
    shipping_price + subtotal
  end

  def empty
    @session.delete(:cart)
  end

  def shipping_price
    23.00 * @session[:currency_rate]
  end
end