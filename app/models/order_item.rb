class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  def total
    price * quantity
  end
end
