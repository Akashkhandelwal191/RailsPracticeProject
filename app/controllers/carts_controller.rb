class CartsController < InheritedResources::Base
 
  before_action :authenticate_user!
 
  def index
      if current_user.cart.present?
         @cart_products = current_user.cart.line_items_products
      else
         @cart_products = current_user.create_cart.line_items_products
      end
  end

  def add_product_to_cart
    @product = Product.find_by_id(params[:id])
    if current_user.cart.present?
       current_user.cart.line_items_products.create(product_id:params[:id],quantity:1,total_price:@product.product_price)
    else
       current_user.create_cart.line_items_products.create(product_id:params[:id],quantity:1,total_price:@product.product_price)
    end

    redirect_to carts_path, notice: 'Product Added To Your Cart'
  end


  def remove_product_from_cart
     @line_item = current_user.cart.line_items_products.find_by_id(params[:id])
     @line_item.destroy
    
     redirect_to carts_path, notice: 'Product Removed From Your Cart'
  end

  private

    def cart_params
      params.require(:cart).permit(:user_id)
    end

end
