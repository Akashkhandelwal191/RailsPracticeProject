require "rails_helper"


RSpec.describe PaymentsController, type: :controller do 


   set_login_user
   
   let!(:category) {FactoryBot.create(:category)}
   let!(:product) {FactoryBot.create(:product, category_id: category.id)}
   let!(:address) {FactoryBot.create(:address,user_id:@user.id)}
   let!(:cart) {FactoryBot.create(:cart,user_id:@user.id)}
   let!(:order) {FactoryBot.create(:order,user_id:@user.id,address_id:address.id)}
   let!(:line_items_product) {FactoryBot.create(:line_items_product,product_id:product.id,purchasable_type:"Order",purchasable_id:order.id)}

   describe "Payment #paymentsuccess" do 
     context "payment success" do 
       it "when payment is successfull" do 
         get :paymentsuccess,params:{id:"pay_MhIK29P3uzzyDq"} 
         expect(response).to have_http_status(302)       
       end
     end
   end




   describe "Payment #pay" do 
      context "order does not have stripe payment intent id" do 
        it "get stript payment id" do 
         get :pay,params:{id:order.id}
         expect(response).to have_http_status(200)
        end
      end
      
      let!(:order2) {FactoryBot.create(:order,user_id:@user.id,address_id:address.id,stripe_payment_intent_id:"pi_3NvEePSF2V7Dompu0skq7BdC")}
      context "order have stripe payment intent id" do 
        it "get stripe payment id" do 
          get :pay,params:{id:order2.id}
          expect(response).to have_http_status(200)
        end
      end 
   end


end