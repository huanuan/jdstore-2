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
    if @product.quantity > 0
      @cart_item = CartItem.find_by(product_id: @product.id, cart_id: current_cart.id)
      if @cart_item
        flash[:alert] = "此商品已在购物车！"
      else
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "成功加入购物车！"
      end

    else
      flash[:alert] = "商品缺货！"
    end
    redirect_to :back
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image, :is_hidden)

  end
end
