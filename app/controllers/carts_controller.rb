class CartsController < InheritedResources::Base
 
  before_action :authenticate_user!
 
  def index
      # if current_user.cart.present?
      #    # @wish_products = current_user.wish_list.products
      # else
      #    @wish_products = current_user.create_wish_list.products
      # end
  end

  private

    def cart_params
      params.require(:cart).permit(:user_id)
    end

end
