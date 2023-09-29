require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user" do
    let!(:user) {FactoryBot.create(:user)}
    context "Associations" do  
       it { is_expected.to have_many(:orders).dependent(:destroy)}
       it { is_expected.to have_one(:user_avatar_attachment).dependent(:destroy) }
       it { is_expected.to have_many(:addresses).dependent(:destroy)}
       it { is_expected.to have_many(:reviews).dependent(:destroy)}
       it { is_expected.to have_one(:cart).dependent(:destroy)}
       it { is_expected.to have_one(:wish_list).dependent(:destroy)}    
    end

    context "Validations" do
      it { is_expected.to validate_presence_of(:first_name)}
      it { is_expected.to validate_presence_of(:last_name) } 
      it {should define_enum_for(:gender).with_values([:male, :female])} 
    end
  end
end
