class OrdersController < InheritedResources::Base


  def index
    @orders = current_user.orders
  end

  def buildorder
    order = Razorpay::Order.create amount: 50000, currency: 'INR', receipt: 'TEST'
    @order_id = order.id
    total_amount = current_user.cart.total_amount
    addressid = params[:id]
    @selected_address = Address.find_by_id(params[:id])
    @make_order = current_user.orders.create(total_amount:total_amount,address_id:addressid)
    @make_order.line_items_products << current_user.cart.line_items_products
    # redirect_to buildorder_path(params[:id])
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
