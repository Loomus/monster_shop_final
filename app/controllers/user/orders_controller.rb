class User::OrdersController < ApplicationController
  before_action :exclude_admin

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])

  end

  def create
    @address = Address.find(params[:address])
    @order = current_user.orders.new(address: @address)
    @order.save
      cart.items.each do |item|
        OrderItem.create({
          item: item,
          quantity: cart.count_of(item.id),
          price: item.price,
          order: @order
          })
      end
    session.delete(:cart)
    flash[:notice] = "Order created successfully!"
    redirect_to '/profile/orders'
  end

  def edit
    @order = Order.find(params[:id])
    @address = current_user.address_options
  end

  def update
    @order = Order.find(params[:id])
    @order.update(address_id: params[:order][:address]) 
    flash[:notice] = "Order Address has been Updated!"
    redirect_to '/profile/orders'
  end

  def cancel
    order = current_user.orders.find(params[:id])
    order.cancel
    redirect_to "/profile/orders/#{order.id}"
  end
end
