require "rails_helper"


RSpec.describe OrdersController, type: :controller do 

    
   set_login_user
   
   let!(:category) {FactoryBot.create(:category)}
   let!(:product) {FactoryBot.create(:product, category_id: category.id)}
   let!(:address) {FactoryBot.create(:address,user_id:@user.id)}
   let!(:cart) {FactoryBot.create(:cart,user_id:@user.id)}
   let!(:order) {FactoryBot.create(:order,user_id:@user.id,address_id:address.id)}
   let!(:line_items_product) {FactoryBot.create(:line_items_product,product_id:product.id,purchasable_type:"Cart",purchasable_id:cart.id)}

   describe "Orders #index" do   
     context "showing current user orders" do 
        it "get index" do 
          get :index 
          expect(response).to have_http_status(200)
        end           
     end 
   end

   describe "Orders #buildorder" do 
      context "showing buildorder" do 
        it "get builorder" do 
         get :buildorder,params:{id:address.id}
         expect(response).to have_http_status(200) 
        end 
      end
   end


   describe "Orders #processorer" do 
      context "showing processorder" do 
        it "get processorder" do 
          get :processorder
          expect(response).to have_http_status(200)
        end
      end
   end


end