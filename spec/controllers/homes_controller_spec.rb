require "rails_helper"

RSpec.describe HomesController, type: :controller do 

   


   describe "Homes #index" do 
     context "when open index" do 
        it "Get Index" do 
           get :index
           expect(response).to have_http_status(200)
        end
     end
   end


   describe "Homes #Search" do 
      context "Search Query" do 
        it "Get Query" do 
          get :search, params: {"query": "phone"}
          expect(response).to have_http_status(200)
        end
      end 
   end



end