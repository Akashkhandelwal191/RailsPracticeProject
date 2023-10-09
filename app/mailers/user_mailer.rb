class UserMailer < ApplicationMailer

	def welcome_mail(user)
     @user = user
     attachments.inline['online-reselling.png'] = File.read('/home/rails-17/Desktop/Akash/Ecommerce/app/assets/images/online-reselling.png')
     mail(to: email_address_with_name(@user.email, @user.first_name),subject: "Welcome To Let's Shop")
    end

    def payment_receipt_mail(user)
      @user = user
      attachments["user_#{user.id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: 'payments/payment_receipt',locals: {url: Rails.application.routes.url_helpers},layout: 'pdf', pdf: "user_#{user.id}"))
      mail(to: email_address_with_name(@user.email, @user.first_name),subject: "Your Order Has Been Successfully Placed!!")
    end
  
    #Send Email to the user after every 1 week on sunday
    def send_reminder(user)
       @user = user 
       mail(to: email_address_with_name(@user.email, @user.first_name),subject: "You Left Something in your cart")
    end

end
