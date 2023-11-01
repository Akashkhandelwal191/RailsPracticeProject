class OrdersController < InheritedResources::Base


  def index
    current_user.orders.each do |order|
       if order.payment.nil? && order.stripe_payment_intent_id.nil?
         order.destroy
       end
    end
  end

  def buildorder
    total_amount = current_user.cart.total_amount
    addressid = params[:id]
    @selected_address = Address.find_by_id(params[:id])
    @make_order = current_user.orders.create(total_amount:total_amount,address_id:addressid)
    current_user.cart.line_items_products.each do |lineitem|
       @make_order.line_items_products.create(quantity:lineitem.quantity,total_price:lineitem.total_price,discounted_price:lineitem.discounted_price,product_id:lineitem.product_id)
    end
  end
  


  def processorder
     @cart_products = current_user.cart.line_items_products
  end


end
