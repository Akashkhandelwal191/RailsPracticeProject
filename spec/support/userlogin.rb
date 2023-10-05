module Userlogin
  def set_login_user
     before(:each) do
        @user = FactoryBot.create(:user)
        sign_in(@user)
     end
  end

  def set_admin_user
    before(:each) do 
     @admin_user = FactoryBot.create(:admin_user)
     sign_in(@admin_user)
    end
  end
end