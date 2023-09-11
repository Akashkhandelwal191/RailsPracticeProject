module HomesHelper
	def count_wish_list_products
       if current_user.wish_list.products.count > 0
           return current_user.wish_list.products.count
       else
          return 0
       end
	end
end
