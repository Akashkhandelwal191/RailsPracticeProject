class UserMailer < ApplicationMailer

	def welcome_mail(user)
     @user = user
     attachments.inline['online-reselling.png'] = File.read('/home/rails-17/Desktop/Akash/Ecommerce/app/assets/images/online-reselling.png')
     mail(to: email_address_with_name(@user.email, @user.first_name),subject: "Welcome To Let's Shop")
    end

end
