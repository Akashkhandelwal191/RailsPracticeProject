require "rails_helper"

RSpec.describe AddressesController, type: :controller do 

  set_login_user
 
  let(:valid_params) {{
    "address": {
      "city": "Indore",
      "country": "India",
      "state": "Madhya Pradesh",
      "area": "Sector-53",
      "address_type": "other",
      "postal_code": 452001      
    }
  }}


  let(:invalid_params) {{
    "address": {
      "city": "Indore",
      "country": "India",
      "state": "Madhya Pradesh",
      "area": nil,
      "address_type": "other",
      "postal_code": 452001      
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

  describe 'Address #destroy' do
    let(:address) {FactoryBot.create(:address,user_id:@user.id)} 
    context 'Destroy Address' do 
      it 'destroy address' do 
         delete :destroy, params: {id:address.id}
         expect(response).to have_http_status(302)
      end
    end 
  end

end