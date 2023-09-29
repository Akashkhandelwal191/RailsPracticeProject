require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "address" do
     let!(:user) {FactoryBot.create(:user)}
     let!(:address) {FactoryBot.create(:address,user_id:user.id)}
     context "Associations" do
      it {should belong_to(:user)}
      it {should define_enum_for(:address_type).with_values([:home,:work,:other])} 
     end
  end
end
