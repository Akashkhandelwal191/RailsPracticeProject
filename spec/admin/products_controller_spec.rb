require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  render_views
  set_admin_user
  let!(:category) {FactoryBot.create(:category)}
  let!(:product) {FactoryBot.create(:product, category_id: category.id)}
  

  let(:valid_params) {{
    "product": {
      "product_name": "HeadPhone",
      "product_description": "it is latest model HeadPhone",
      "product_price": 300,
      "product_quantity": 10,
      "offer": 10,
      "category_id":1     
    }
  }}


  let(:invalid_params) {{
    "product": {
      "product_name": nil,
      "product_description": "it is latest model HeadPhone",
      "product_price": 300,
      "product_quantity": 10,
      "offer": 10,
      "category_id":1     
    }
  }}
 

  describe "Product #Show" do
     context "Get Show" do 
       it "should have http success" do 
        get :show,params:{ id: product.id}
        expect(response).to have_http_status(200)
       end
     end
  end 


  describe 'Product #create' do
    context 'When params are valid' do 
      it 'should have redirect' do 
        post :create, params: valid_params
        expect(response).to have_http_status(302)
      end
    end

    context 'When params are invalid' do 
       it 'should have http success' do 
        post :create, params: invalid_params
        expect(response).to have_http_status(200)
       end
    end
  end


  describe 'Product #update' do 
   context 'when params are valid' do 
     it 'should have redirect' do 
      put :update, params:{id: product.id}
      expect(response).to have_http_status(302)
     end
   end

   context 'when params are invalid' do 
     it 'should have http status' do 
       put :update, params:{id: product.id, product: {product_name: nil}}
       expect(response).to have_http_status(200)
     end
   end
  end  



end