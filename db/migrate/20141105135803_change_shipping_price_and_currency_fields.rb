class ChangeShippingPriceAndCurrencyFields < ActiveRecord::Migration
  def change
    change_column :orders, :total, :decimal, precision: 10, scale: 4, null: false
    change_column :orders, :shipping_price, :decimal, precision: 7, scale: 4, null: false
  end
end
