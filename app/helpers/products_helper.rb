module ProductsHelper

	def calculate_rating(rating)
 
    case rating
  
     when 1..2
      return "Poor"
  
     when 3
      return "Average"
  
     when 4
      return "Good"
  
     else
      return "Excellent"
    end
	                       
  end

  def avg_rating(product_id)
    
     product = Product.find_by_id(product_id)
     sum = product.reviews.pluck(:rating).sum
     deno = product.reviews.count
     avg = sum.to_f / deno.to_f
     return avg
  end

end
