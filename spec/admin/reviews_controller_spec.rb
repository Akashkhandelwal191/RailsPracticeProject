require 'rails_helper'

RSpec.describe Admin::ReviewsController, type: :controller do

     # this lets us inspect the rendered results
  render_views

  set_admin_user
  
  let!(:user) {FactoryBot.create(:user)}
  let!(:category) {FactoryBot.create(:category)}
  let!(:product) {FactoryBot.create(:product,category_id:category.id)}
  let!(:review) {FactoryBot.create(:review,user_id:user.id,product_id:product.id)}

  let(:valid_params) {{
    "review": {
      "description": "this product is good",
      "rating": 3,
      "user_id": 1,
      "product_id": 1      
    }
  }}


  let(:invalid_params) {{
     "review": {
      "description": nil,
      "rating": 3,
      "user_id": 1,
      "product_id": 1      
    }
  }}
 

  describe "Post Create" do 
    context "when params are valid" do
      it "return http success" do 
        post :create,params: valid_params
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when params are invalid" do
      it "return http success" do 
        post :create,params: invalid_params
        expect(response).to have_http_status(:success)
      end
    end
  end


  describe "Put Update" do 
    context "when params are valid" do
      it "return http success" do 
        put :update, params: {id:review.id}
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when params are invalid" do
      it "return http success" do 
        put :update, params: {id:review.id, review: {description:nil,rating:3}}
        expect(response).to have_http_status(:success)
      end
    end
  end

end