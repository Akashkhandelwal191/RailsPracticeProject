require 'rails_helper'

RSpec.describe LineItemsProduct, type: :model do
  describe "LineItemsProduct" do
     let!(:user) {FactoryBot.create(:user)}
     let!(:category) {FactoryBot.create(:category)} 
     let!(:product) {FactoryBot.create(:product,category_id:category.id)}
     let!(:cart) {FactoryBot.create(:cart,user_id:user.id)}
     let!(:line_items_product) {FactoryBot.create(:line_items_product,product_id:product.id,purchasable_type:"Cart",purchasable_id:cart.id)}
     context "Associations" do 
       it { should belong_to(:product)}
       it { should belong_to(:purchasable)}
     end
  end
end
