class Order < ActiveRecord::Base
  has_many :order_items

  scope :recent, -> { order created_at: :desc }

  def subtotal
    total - shipping_price
  end

  def paid!
    update_attribute(:status, 'paid')
  end

  def cancel!
    update_attribute(:status, 'canceled')
  end

  def unpaid!
    update_attribute(:status, 'unpaid')
  end

  def update_status_by_coingate(coingate_status)
    update_attribute(:coingate_status, coingate_status)

    case coingate_status
    when 'paid'       then paid!
    when 'canceled'   then cancel!
    else unpaid!
    end
  end

  def fetch_and_update_status
    cg_order = CoingateService.new.get_order(coingate_id)
    update_status_by_coingate(cg_order.response[:status])
  end
end
