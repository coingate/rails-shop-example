class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, null: false, index: true
      t.references :item, null: false, index: true
      t.decimal :price, null: false, precision: 8, scale: 2
      t.integer :quantity, null: false, limit: 2

      t.timestamps
    end
  end
end
