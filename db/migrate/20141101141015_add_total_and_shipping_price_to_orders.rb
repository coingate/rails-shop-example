class AddTotalAndShippingPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :total, :decimal, precision: 8, scale: 2, null: false, default: 0, after: :id
    add_column :orders, :shipping_price, :decimal, precision: 5, scale: 2, null: false, default: 0, after: :total
  end
end
