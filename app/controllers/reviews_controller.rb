class ReviewsController < InheritedResources::Base
  
  before_action :authenticate_user! 
  before_action :set_product

  def new
    @review = Review.new

    respond_to do |format|
      format.html 
      format.js   
    end
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @product, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end


  def review_params
    params.require(:review).permit(:description, :rating, :user_id, :product_id)
  end

end
