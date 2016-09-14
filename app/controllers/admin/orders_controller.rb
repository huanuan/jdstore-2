class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def edit
    @order = Order.find(params[:id])
    
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_orders_path, notice:'Order update'
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to admin_orders_path,  alert:'Order deleted'
  end

  private

  def order_params
    params.require(:order).permit(:total, :billing_name, :billing_address, :shipping_name, :shipping_address, :created_at, :user_id)

  end
end
