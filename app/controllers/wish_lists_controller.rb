class WishListsController < ApplicationController
  
  def index
    # @wish_products = WishList.find_by(user_id:current_user.id).products
    if current_user.wish_list.present?
      @wish_products = current_user.wish_list.products
    else
      @wish_products = current_user.create_wish_list.products
    end
  end

  def show
  end
end
