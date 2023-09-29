require 'rails_helper'

RSpec.describe WishList, type: :model do
   describe "WishList" do 
     let!(:user) {FactoryBot.create(:user)}
     let!(:wish_list) {FactoryBot.create(:wish_list,user_id:user.id)}
     context "Associations" do 
       it { should belong_to(:user)}
       it { should have_and_belong_to_many(:products)}
     end
   end
end
