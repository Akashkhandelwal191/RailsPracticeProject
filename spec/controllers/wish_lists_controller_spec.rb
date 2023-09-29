require "rails_helper"

RSpec.describe WishListsController, type: :controller do 

   before(:each) do
    @user = FactoryBot.create(:user)
    sign_in(@user)
   end


   



end