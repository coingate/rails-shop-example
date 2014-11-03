class CreateOrderFailures < ActiveRecord::Migration
  def change
    create_table :order_failures do |t|
      t.references :order, null: false, index: true
      t.integer :http_status
      t.string :reason
      t.text :message

      t.timestamps
    end
  end
end
