class ProductsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @products = Product.where(is_hidden:false).order("created_at DESC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to :back
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image, :is_hidden)

  end
end
