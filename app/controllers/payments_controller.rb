class PaymentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :notify

  def notify
    id    = params[:order_id].split('-').last
    order = Order.find_by(id: id)
    
    order.update_status_by_coingate(params[:status]) if order && order.token == params[:token]

    render nothing: true
  end

  def success
    
  end

  def check
    order = Order.find_by(id: session[:current_order])

    render json: order
  end
end