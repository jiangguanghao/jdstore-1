class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Oder.order("id DESC")
  end

  def Show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end
end
