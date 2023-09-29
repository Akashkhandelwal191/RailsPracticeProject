require "rails_helper"

RSpec.describe CartsController, type: :controller do 

	before(:each) do
	 	@user = FactoryBot.create(:user)
	 	sign_in(@user)
	end
	let(:cart) {FactoryBot.create(:cart,user_id:@user.id)}
 
	 describe "Carts Index" do 
		context "if current user don't have cart" do
			before do
				cart
			end 
		  it "Get Index" do 
		    get :index
		    expect(response).to have_http_status(200)
		  end
	  end
	 
	  context "if current user have cart" do 
	    it "Get index" do 
	      get :index
	      expect(response).to have_http_status(200)   
	    end
	  end
	end
end
