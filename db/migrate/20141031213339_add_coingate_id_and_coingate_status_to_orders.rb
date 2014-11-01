class AddCoingateIdAndCoingateStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :coingate_id, :string, after: :status
    add_column :orders, :coingate_status, :string, after: :coingate_id
  end
end
