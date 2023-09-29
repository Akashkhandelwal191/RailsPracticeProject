require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "cart" do 
     let!(:user) {FactoryBot.create(:user)}
     let!(:cart) {FactoryBot.create(:cart,user_id:user.id)}
     context "Associations" do 
        it {should belong_to(:user)}
        it {should have_many(:line_items_products).dependent(:destroy)}
     end
  end
 end
