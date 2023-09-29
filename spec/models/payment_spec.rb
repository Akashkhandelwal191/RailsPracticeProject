require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe "payment" do 
    let!(:user) {FactoryBot.create(:user)}
    let!(:address) {FactoryBot.create(:address,user_id:user.id)}
    let!(:cart) {FactoryBot.create(:cart,user_id:user.id)}
    let!(:order) {FactoryBot.create(:order,user_id:user.id,address_id:address.id)}
    let!(:payment) {FactoryBot.create(:payment,order_id:order.id)}
    context "Associations" do 
       it {should belong_to(:order)}
    end
  end
end
