class OrdersController < ApplicationController
  def index
    @orders = Order.recent
  end

  def show
    @order = Order.find(params[:id])

    add_breadcrumb 'Orders', :orders_path
    add_breadcrumb "Order ##{@order.id}", order_path(@order.id)
  end
end