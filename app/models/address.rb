class Address < ApplicationRecord
  belongs_to :user
  enum :address_type, [:home,:work,:other],default: :home
  validates :state, :city, :country, :area, :postal_code, presence:true
end
