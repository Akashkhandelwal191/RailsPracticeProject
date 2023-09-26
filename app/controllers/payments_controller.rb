class PaymentsController < ApplicationController
  
    def paymentsuccess
      paymentId = params[:id]
      payment = Razorpay::Payment.fetch(paymentId)
      current_user.orders.last.create_payment(payment_method:payment.method,payment_id:paymentId)
      current_user.orders.last.line_items_products.each do |lineitem|
         d = lineitem.product.product_quantity - lineitem.quantity
         lineitem.product.update(product_quantity:d)
      end
      current_user.cart.destroy
      redirect_to '/orders'
    end

    
    def paymentfailed
    end

    def payment_receipt
      @user = current_user
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: [@user.id, @user.first_name].join('-'),
                 template: "payments/payment_receipt",
                 title:"#{@user.first_name}",
                 formats: [:html],
                 disposition: :inline,  
                 layout: 'pdf'
        end
      end
    end


end
