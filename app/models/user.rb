class User < ApplicationRecord
  has_secure_password

  belongs_to :merchant, optional: true
  has_many :orders
  has_many :addresses
  accepts_nested_attributes_for :addresses

  validates_presence_of :name,
                        :email

  validates_uniqueness_of :email

  enum role: ['default', 'merchant_admin', 'admin']

  def address_options
    options = {}
    self.addresses.all.each do |a|
      options[a.nickname] = a.id
    end
    options
  end
end
