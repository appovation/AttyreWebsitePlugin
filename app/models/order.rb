class Order < ApplicationRecord
  belongs_to :shop, optional: true

  validate :order_uniqueness

  after_create :send_email

  def order_uniqueness
    if Order.where(shop_id: self.shop_id, order_number: self.order_number).present?
      errors.add(:order_number, 'Already Created this order')
    end
  end

  def send_email
    OrdersMailer.order_received(self).deliver
  end
end
