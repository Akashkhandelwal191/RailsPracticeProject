require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "order" do
    let!(:user) {FactoryBot.create(:user)}
    let!(:address) {FactoryBot.create(:address,user_id:user.id)}
    let!(:cart) {FactoryBot.create(:cart,user_id:user.id)}
    let!(:order) {FactoryBot.create(:order,user_id:user.id,address_id:address.id)}
    context "Associations" do 
      it {should belong_to(:user)}
      it {should belong_to(:address)}
      it {should have_one(:payment).dependent(:destroy)}
      it {should have_many(:line_items_products).dependent(:destroy)}
    end

    context "Validations" do 
      it {should define_enum_for(:status).with_values([:pending,:processing,:shipped,:delivered])} 
    end
  end
end
