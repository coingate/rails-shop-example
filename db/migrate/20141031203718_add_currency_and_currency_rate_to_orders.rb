class AddCurrencyAndCurrencyRateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :currency, :string, default: 'USD', null: false, after: :id
    add_column :orders, :currency_rate, :decimal, precision: 8, scale: 4, null: false, default: 1, after: :currency
  end
end
