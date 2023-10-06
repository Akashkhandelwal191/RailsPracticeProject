require 'rails_helper'

RSpec.describe Admin::AddressesController, type: :controller do

  render_views
  set_admin_user
 
  let!(:user) {FactoryBot.create(:user)}
  let!(:address) {FactoryBot.create(:address,user_id:user.id)}

 let(:valid_params) {{
    "address": {
      "city": "Indore",
      "country": "India",
      "state": "Madhya Pradesh",
      "area": "Sector-53",
      "address_type": "other",
      "postal_code": 452001, 
      "user_id": 1     
    }
  }}


  let(:invalid_params) {{
    "address": {
      "city": "Indore",
      "country": "India",
      "state": "Madhya Pradesh",
      "area": nil,
      "address_type": "other",
      "postal_code": 452001,
      "user_id":1      
    }
  }}
 


 describe 'Address #create' do
    context 'When Create with all fields' do 
      it 'return created when user_entity' do 
        post :create, params: valid_params
        expect(response).to have_http_status(302)
      end
    end

    context 'When Creating mandatory fields empty' do 
       it 'return error to users' do 
        post :create, params: invalid_params
        expect(response).to have_http_status(200)
       end
    end
 end

 describe 'Address #update' do 
   context 'when params are valid' do 
     it 'should have redirect' do 
      put :update, params:{id: address.id}
      expect(response).to have_http_status(302)
     end
   end

   context 'when params are invalid' do 
     it 'should have http status' do 
       put :update, params:{id: address.id, address: {city: nil}}
       expect(response).to have_http_status(200)
     end
   end
 end  


 




end