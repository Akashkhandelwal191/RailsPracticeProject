class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

     def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,:user_avatar,:first_name,:last_name,:gender,:mobile_number,:username,:password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password,:user_avatar,:first_name,:last_name,:gender,:mobile_number,:username,:password_confirmation)}
     end

      def commoncode
         @product = Product.find_by_id(params[:id])
         updated_discounted_price = @product.product_price - (@product.product_price * (@product.offer) / 100)    
         if current_user.cart.present?
            current_user.cart.line_items_products.create(product_id:params[:id],quantity:1,total_price:@product.product_price,discounted_price:updated_discounted_price)
         else
            current_user.create_cart.line_items_products.create(product_id:params[:id],quantity:1,total_price:@product.product_price,discounted_price:updated_discounted_price)
         end

         if current_user.cart.line_items_products.count == 1       
            current_user.cart.update(total_price:updated_discounted_price,total_amount:(updated_discounted_price))      
         else   
            current_user.cart.update(total_price: (current_user.cart.total_price + updated_discounted_price),total_amount: (current_user.cart.total_amount + updated_discounted_price))
         end 
         calc_discount       
      end


      def calc_discount
        if current_user.cart.total_amount > 2000
           actual_total_amount = current_user.cart.total_price - (current_user.cart.total_price * (10) / 100)
           current_user.cart.update(total_amount:(actual_total_amount+200)) 
        else 
           current_user.cart.update(total_amount:(current_user.cart.total_price+200))
        end 
      end

end
