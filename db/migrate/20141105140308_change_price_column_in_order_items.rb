class ChangePriceColumnInOrderItems < ActiveRecord::Migration
  def change
    change_column :order_items, :price, :decimal, precision: 10, scale: 4, null: false
  end
end
