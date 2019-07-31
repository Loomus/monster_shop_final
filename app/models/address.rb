class Address < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates_presence_of :address,
                        :city,
                        :state,
                        :zip

  def shipped_orders
    orders.where(status: 'shipped')
  end

  def pending_orders
    orders.where(status: 'pending')
  end
end
