class ProductsController < InheritedResources::Base

  
  def show
      @product = Product.find(params[:id])
  end
   


  private

    def product_params
      params.require(:product).permit()
    end

end
