require "rails_helper"


RSpec.describe LineItemsProductsController, type: :controller do 


   set_login_user
   let!(:cart) {FactoryBot.create(:cart,user_id:@user.id)}
   let!(:category) {FactoryBot.create(:category)}
   let!(:product) {FactoryBot.create(:product, category_id: category.id)}
   let!(:line_items_product) {FactoryBot.create(:line_items_product,product_id:product.id,purchasable_type:"Cart",purchasable_id:cart.id)}
   let!(:line_items_product2) {FactoryBot.create(:line_items_product,product_id:product.id,purchasable_type:"Cart",purchasable_id:cart.id,quantity:0)}
   

    describe "LineItemsProduct #index" do 
      context "showing index page" do 
        it "get index" do
           get :index
           expect(response).to have_http_status(200)
        end
      end
    end


    describe "LineItemsProduct #increment" do 
        context "when line items product quantity is greater than product quantity" do
          it "when user click on increment button" do 
            get :increment,params:{id:line_items_product.id}
            expect(response).to have_http_status(302)
          end
        end 


        context "when line items product quantity is less than product quantity" do
           it "get increment" do 
            get :increment,params:{id:line_items_product2.id}
            expect(response).to have_http_status(302)
           end
        end
    end

    describe "LineItemsProduct #decrement" do 
        context "when line items product quantity is greater than product quantity" do 
          it "when user click on decrement button" do 
           get :decrement, params:{id:line_items_product.id}
           expect(response).to have_http_status(302) 
          end
        end

        context "when line items product quantity is less than product quantity" do 
          it "get decrement" do 
           get :decrement, params:{id:line_items_product2.id}
           expect(response).to have_http_status(302)
          end
        end
    end

end