class AddTokenToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :token, :string, after: :status
  end
end
