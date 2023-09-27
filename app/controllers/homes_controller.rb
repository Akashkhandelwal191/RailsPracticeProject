class HomesController < ApplicationController
  
  def index
    @categories = Category.all
  end

  def show
  end

  def search
    @search_products = Product.where("product_name LIKE ?","%#{params[:query]}%").page(params[:page]).per(3)
  end

end
