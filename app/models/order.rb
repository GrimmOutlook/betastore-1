class Order < ActiveRecord::Base
  belongs_to :customer
  has_one :refund

  def self.recent
    where("placed_at > ?", 7.days.ago)
  end

  def self.by(customer)
    where(customer_id: customer.id)
  end

end
