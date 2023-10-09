class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    a = User.all
    a.each do |u|
      if u.cart && u.cart.line_items_products.count > 0
         UserMailer.send_reminder(u).deliver_now
      end
    end
  end
end
