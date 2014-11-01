class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  def total
    (price * order.currency_rate) * quantity
  end
end
