require "rails_helper"

RSpec.describe "Reviews", type: :request do 

    set_login_user
    let!(:category) {FactoryBot.create(:category)}
    let!(:product) {FactoryBot.create(:product, category_id: category.id)}

    let(:valid_params) {{
    "review": {
      "description": "this product is good",
      "rating": 3,
      "user_id": @user.id,
      "product_id": product.id    
    }
  }}
    
   let(:invalid_params) {{
    "review": {
      "description": nil,
      "rating": 4,
      "user_id": @user.id,
      "product_id": product.id    
    }
  }}
    


    describe "Review #Creation" do 
      context "new action" do 
        it "get new" do 
         get "/products/#{product.id}/reviews/new"
         expect(response).to have_http_status(200)
        end
      end 

      context "create action for valid params" do 
        it "post create" do 
          post "/products/#{product.id}/reviews",params: valid_params
          expect(response).to have_http_status(302)
        end
      end


      context "create action for invalid params" do 
        it "post create" do 
          post "/products/#{product.id}/reviews",params: invalid_params
          expect(response).to have_http_status(200)
        end
      end
    end


 
end