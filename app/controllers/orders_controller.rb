class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @ooder.user = current_user
    @order.total = current_cart.total_price

    if @order.save
      redirect_to order_path(@order)
    else
      render 'carts/checkout'
    end
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, L:shipping_name, :shipping_address)
  end
end
