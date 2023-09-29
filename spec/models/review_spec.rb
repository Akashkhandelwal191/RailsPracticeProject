require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "review" do 
     let!(:user) {FactoryBot.create(:user)}
     let!(:category) {FactoryBot.create(:category)}
     let!(:product) {FactoryBot.create(:product,category_id:category.id)}
     let!(:review) {FactoryBot.create(:review,user_id:user.id,product_id:product.id)}
     context "Associations" do
       it {should belong_to(:user)}
       it {should belong_to(:product)}
     end
  end
end
