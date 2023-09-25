module ApplicationHelper

	def date_formating(dtime)
      dtime.strftime("%A, %B %d, %Y at %I:%M %P")
	end
end
