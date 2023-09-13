module HomesHelper
	def count_wish_list_products
       if current_user.wish_list.products.count > 0
           return current_user.wish_list.products.count
       else
          return 0
       end
	end

   def truncate(string, max=20)
      string.length > max ? "#{string[0...max]}..." : string
   end

   def format_number(number)
       whole, decimal = number.to_s.split(".")
       num_groups = whole.chars.to_a.reverse.each_slice(3)
       whole_with_commas = num_groups.map(&:join).join(',').reverse
       [whole_with_commas, decimal].compact.join(".")
   end


   def calculateoffer(price,offer)
     afterDiscount = price - (price * offer / 100)
     return afterDiscount
   end

  
end
