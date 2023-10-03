require "rails_helper"

RSpec.describe CartsController, type: :controller do 

  set_login_user
  
  let(:cart) {FactoryBot.create(:cart,user_id:@user.id)}
  let(:category) {FactoryBot.create(:category)}
  let(:product) {FactoryBot.create(:product, category_id: category.id)}
  let(:line_items_product) {FactoryBot.create(:line_items_product,product_id:product.id,purchasable_type:"Cart",purchasable_id:cart.id)}
 
   describe "Carts Index" do 
    context "if current user have a cart" do
      before do
        cart
      end 
      it "Get Index" do 
        get :index
        expect(response).to have_http_status(200)
      end
    end
   
    context "if current user don't have cart" do 
      it "Get index" do 
        get :index
        expect(response).to have_http_status(200)   
      end
    end
  end


   describe "Add Product To Cart" do 
     before do
        cart
        category
        product
     end   
     context "add product to cart" do 
       it "if user click on product" do  
          get :add_product_to_cart, params: {id:product.id}
          expect(response).to have_http_status(302)
       end
     end
   end

   describe "Remove Product From Cart" do    
     context "remove product from cart if current user only one item in a cart" do
       before do
          cart
          category
          product
          line_items_product
       end  
       it "remove when user only one item in a cart" do 
          get :remove_product_from_cart,params:{id:line_items_product.id}
          expect(response).to have_http_status(302)
       end
     end
     
     
     let!(:product2) {FactoryBot.create(:product, category_id: category.id)}
     let!(:line_items_product2) {FactoryBot.create(:line_items_product,product_id:product2.id,purchasable_type:"Cart",purchasable_id:cart.id)}
     context "remove product from cart if current user more than one item in a cart" do    
        it "remove item if user have more than one item in a cart" do 
          get :remove_product_from_cart,params:{id:line_items_product2.id}
          expect(response).to have_http_status(302)
        end
     end
   end

end
