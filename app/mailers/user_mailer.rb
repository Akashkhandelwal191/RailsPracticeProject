class UserMailer < ApplicationMailer

	def welcome_mail(user)
     @user = user
     mail(to: email_address_with_name(@user.email, @user.first_name),subject: "Welcome To Let's Shop")
  end

end
