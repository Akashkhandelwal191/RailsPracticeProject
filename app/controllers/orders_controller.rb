class OrdersController < InheritedResources::Base


  def index
    @orders = current_user.orders
  end


  def show

  end

  def processorder
     @cart_products = current_user.cart.line_items_products
  end

  private

    def order_params
      params.require(:order).permit()
    end

end
