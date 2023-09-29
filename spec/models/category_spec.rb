require 'rails_helper'

RSpec.describe Category, type: :model do
   describe "category" do
    let!(:category) {FactoryBot.create(:category)}
    context "Associations" do  
       it { is_expected.to have_many(:products).dependent(:destroy)}
       it { is_expected.to have_one(:category_image_attachment).dependent(:destroy) }   
    end

    context "Validations" do
      it { is_expected.to validate_presence_of(:category_name)}
    end
  end
end
