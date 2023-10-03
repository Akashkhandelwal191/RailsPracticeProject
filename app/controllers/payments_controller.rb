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
      # @user = current_user
      # respond_to do |format|
      #   format.html
      #   format.pdf do
      #     render pdf: [@user.id, @user.first_name].join('-'),
      #            template: "payments/payment_receipt",
      #            title:"#{@user.first_name}",
      #            formats: [:html],
      #            disposition: :inline,  
      #            layout: 'pdf'
      #   end
      # end
    end



    def pay
        @order = Order.find(params[:id])

        if @order.stripe_payment_intent_id
          payment_intent = get_payment_intent
        else
          payment_intent = create_payment_intent
          
          @order.update!(stripe_payment_intent_id: payment_intent.id)
        end

        @payment_intent_client_secret = payment_intent.client_secret
    end


    private
      
      def create_payment_intent
        actual_amount = (@order.total_amount*100).to_i
        Stripe::PaymentIntent.create({
          amount: actual_amount,
          currency: 'inr',
          automatic_payment_methods: {enabled: true},
          description: "Order #{@order.id}"
        })
      end

      def get_payment_intent
        Stripe::PaymentIntent.retrieve(@order.stripe_payment_intent_id)
      end


end
