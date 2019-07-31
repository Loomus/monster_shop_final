class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = current_user.addresses.new(address_params)
    @address.save
    redirect_to profile_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to profile_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to profile_path
  end

  def no_address
    redirect_to new_address_path
  end
end

private

  def address_params
    params.require(:address).permit(:address, :city, :state, :zip, :nickname)
  end
