class ReviewsController < InheritedResources::Base

  private

    def review_params
      params.require(:review).permit(:description, :rating, :user_id, :product_id)
    end

end
