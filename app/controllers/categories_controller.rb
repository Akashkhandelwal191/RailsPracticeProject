class CategoriesController < InheritedResources::Base

  private

    def category_params
      params.require(:category).permit(:category_name,:category_image)
    end

end