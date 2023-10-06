require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do

  render_views
  set_admin_user
  let!(:category) {FactoryBot.create(:category)}
   
  let(:valid_params){{
    "category": {
      "category_name": Faker::Name.name
    }
  }}


  let(:invalid_params) {{
    "category": {
       "category_name": nil       
    }
  }}


  describe "Category Create" do 
    context "when params are valid" do 
      it "should have redirect" do 
       post :create, params: valid_params
       expect(response).to have_http_status(:redirect)
      end 
    end

    context "when params are invalid" do 
       it "should have http success" do 
        post :create, params: invalid_params
        expect(response).to have_http_status(:success)
       end
    end
  end

  describe "Category Update" do 
    context "when params are valid" do 
      it "should have redirect" do 
       put :update, params: {id: category.id}
       expect(response).to have_http_status(:redirect)
      end
    end

    context "when params are invalid" do 
      it "should have http success" do 
       put :update, params: {id: category.id , category: {category_name:nil}}
       expect(response).to have_http_status(:success)
      end
    end
  end


  describe "Category Show" do 
    context "get show" do 
      it "should have success" do 
       get :show, params: {id: category.id} 
       expect(response).to have_http_status(:success)
      end
    end
  end

end
