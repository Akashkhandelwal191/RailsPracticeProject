class PaymentsController < ApplicationController
  
    def paymentsuccess
      paymentId = params[:id]
      payment = Razorpay::Payment.fetch(paymentId)
      current_user.orders.last.create_payment(payment_method:payment.method,payment_id:paymentId)
      current_user.cart.destroy
      redirect_to '/orders'
    end

    
    def paymentfailed
    end


end
