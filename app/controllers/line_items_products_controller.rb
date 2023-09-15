class LineItemsProductsController < ApplicationController

    
    def increment
        line_item_product = LineItemsProduct.find_by_id(params[:id])
        if  line_item_product.quantity < line_item_product.product.product_quantity 
        	updated_quantity = line_item_product.quantity + 1
        	updated_total_price = updated_quantity * line_item_product.product.product_price  
            line_item_product.update(quantity:updated_quantity,total_price:updated_total_price)
            redirect_to carts_path, notice:"You have increased the quantity to #{updated_quantity}"
        else
            redirect_to carts_path, alert:"We're sorry!! Only #{line_item_product.quantity} units available"
        end 
        
    end


    def decrement
    	 line_item_product = LineItemsProduct.find_by_id(params[:id])
    	 if line_item_product.quantity > 1
    	   updated_quantity = line_item_product.quantity - 1
    	   updated_total_price = updated_quantity * line_item_product.product.product_price  
    	   line_item_product.update(quantity:updated_quantity,total_price:updated_total_price)
    	   redirect_to carts_path, notice:"You have decreased the quantity to #{updated_quantity}"
    	 else
           redirect_to carts_path, alert:"At least one quantity is required"
         end 
    end
   

end
