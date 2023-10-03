require "rails_helper"

RSpec.describe ProductsController, type: :controller do 
 
   
    set_login_user

    describe "Products #show" do 
      let!(:category) {FactoryBot.create(:category)}
      let!(:product) {FactoryBot.create(:product, category_id: category.id)}
      context "showing specific page" do 
        it "Get show" do 
          get :show, params: {id:product.id}
          expect(response).to have_http_status(200)
        end
      end
    end


    describe "Products #buynow" do 
       let!(:cart) {FactoryBot.create(:cart,user_id:@user.id)}
       let!(:category) {FactoryBot.create(:category)}
       let!(:product) {FactoryBot.create(:product, category_id: category.id)}
       context "Buynow feature" do 
          it "get buynow" do 
            get :buynow, params:{id:product.id}
            expect(response).to have_http_status(302)
          end
       end
    end
 

end