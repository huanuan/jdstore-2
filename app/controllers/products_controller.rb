class ProductsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @products = Product.where(is_hidden:false).order("created_at DESC")
  end

  def show
    @product = Product.find(params[:id])
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image, :is_hidden)

  end
end
