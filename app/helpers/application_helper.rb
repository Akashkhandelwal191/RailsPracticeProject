module ApplicationHelper

	def date_formating(dtime)
      dtime.strftime("%A, %B %d, %Y at %I:%M %P")
	end

	def calculatediscount(total_price)
	  if total_price > 2000
        discount = (total_price*10)/100
        return discount 
      else
        return "Not Applicable"
      end
	end
end
