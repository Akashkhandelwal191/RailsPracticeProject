class ProductsController < InheritedResources::Base

  
  def show
      @product = Product.find(params[:id])
  end

  def buynow
    if current_user.cart.line_items_products.find_by(product_id:params[:id]).nil?
         commoncode
    end
    @cart_products = current_user.cart.line_items_products
    redirect_to '/orders/processorder'
  end

end
