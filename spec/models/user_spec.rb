require 'rails_helper'

RSpec.describe User do
  describe 'Relationships' do
    it {should belong_to(:merchant).optional}
    it {should have_many :orders}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
  end

  describe 'Instance Methods' do
    before :each do
    @user = User.create!(name: 'Megan', email: 'megan_1@example.com', password: 'securepassword')
    @address = @user.addresses.create!(address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, nickname: 'Home')
  end

    it '.address_options' do
      expect(@user.address_options).to eq({@address.nickname => @address.id})
    end
  end
end
