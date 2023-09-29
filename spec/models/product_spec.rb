require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "product" do
    let!(:category) {FactoryBot.create(:category)}
    let!(:product) {FactoryBot.create(:product, category_id: category.id)}
    context "Associations" do  
       it { should belong_to(:category) }
       it { is_expected.to have_many(:reviews).dependent(:destroy)}
       it { is_expected.to have_many(:product_images_attachments).dependent(:destroy) }   
       it {  should have_and_belong_to_many(:wish_lists) }
    end
  end
end
