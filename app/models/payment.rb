class Payment < ApplicationRecord
  belongs_to :order
  after_create :send_payment_receipt


  def send_payment_receipt
        UserMailer.payment_receipt_mail(self.order.user).deliver_now
  end

end
