require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do

 
   render_views
   set_admin_user


   describe "Dashboard #index" do 
     context "Get Index" do 
       it "it should return success" do 
        get :index 
        expect(response).to have_http_status(:success)
       end
     end
   end

end