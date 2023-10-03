require "rails_helper"

RSpec.describe WishListsController, type: :controller do 

    set_login_user
    let(:wish_list) {FactoryBot.create(:wish_list,user_id:@user.id)}
    let!(:category) {FactoryBot.create(:category)}
    let!(:product) {FactoryBot.create(:product, category_id: category.id)}


    describe "WishList #index" do 
      context "current user don't have wishList" do 
        it "when current user don't have wishlist" do 
          get :index
          expect(response).to have_http_status(200)
        end
      end

      context "current user have a wishlist" do
         before do 
            wish_list
         end 
         it "when current user have a wishlist" do 
            get :index 
            expect(response).to have_http_status(200)
         end
      end

    end


    describe "WishList #AddItem" do 
       context "product is not already added" do 
         before do 
            wish_list
         end
         it "when product is not already added" do 
            get :additem,params:{id:product.id}
            expect(response).to have_http_status(200)
         end
       end

       context "product is already added" do 
           before do 
              wish_list
              wish_list.products << Product.find(product.id)
           end
           it "when product is already added" do 
             get :additem,params:{id:product.id}
             expect(response).to have_http_status(200)
           end
       end
    end
 
     describe "WishList #destroy" do 
         context "delete product from wishlist" do 
           before do 
              wish_list
              wish_list.products << Product.find(product.id)
           end
           it "when delete product from wishlist" do 
               delete :destroy,params:{id:product.id}
               expect(response).to have_http_status(303)
           end
         end
     end
   



end