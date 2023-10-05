require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

     # this lets us inspect the rendered results
  render_views

  set_admin_user
  let!(:user) {FactoryBot.create(:user)}
  
 
 
   describe "GET index" do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
   end

   describe "GET show" do 
     it 'returns https success' do 
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:success)
     end
   end

end