require 'rails_helper'

RSpec.describe Admin::AdminUsersController, type: :controller do

     # this lets us inspect the rendered results
  render_views

  set_admin_user

  let(:page) { Capybara::Node::Simple.new(response.body) } 
  let!(:user) {FactoryBot.create(:user)}
  
  let(:valid_params) {{
    "admin_user": {
      "email": "slok@example.com",
      "password": "909090",
      "password_confirmation": "909090",      
    }
  }}


  let(:invalid_params) {{
    "admin_user": {
      "email": "slok@example.com",
      "password": "",
      "password_confirmation": "909090",      
    }
  }}

 
 
   describe "GET index" do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
   end


   describe "Post Create" do
     context 'when params are valid' do 
       it 'returns http success' do
          post :create,params: valid_params
          expect(response).to have_http_status(302)
       end
     end

     context 'when params are invalid' do 
       it 'returns http success' do
          post :create,params: invalid_params
          expect(response).to have_http_status(:success)
       end
     end
   end


   describe 'Patch Update' do 
     context 'when params are valid' do 
       it 'returns http success' do 
        put :update, params: {id: 1 , admin_user: valid_params}
        expect(response).to have_http_status(:redirect)
       end
     end

     context 'when params are invalid' do 
       it "returns http success" do 
         put :update, params:{id:1, admin_user: invalid_params}
         expect(response).to have_http_status(302)
       end
     end
   end

end