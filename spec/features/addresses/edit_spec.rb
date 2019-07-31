require 'rails_helper'

RSpec.describe "Address Edit Page" do
  describe 'As a user when I visit the "edit_user_address_path"' do
    it 'I am able to edit an existing address' do
      @user_b = User.create!(name: 'b', email: 'b', password: 'b')
       @address_b = @user_b.addresses.create!(address: 'b', city: 'b', state: 'b', zip: 22222, nickname: 'Home')

       visit login_path
       fill_in 'Email', with: @user_b.email
       fill_in 'Password', with: @user_b.password
       click_button 'Log In'

       click_link 'Edit an Address'

       fill_in 'Address', with: 'b2'
       fill_in 'City', with: 'b2'
       fill_in 'State', with: 'b2'
       fill_in 'Zip', with: 22222

       click_button 'Edit'

    end
  end
end
