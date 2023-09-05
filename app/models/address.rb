class Address < ApplicationRecord
  belongs_to :user
  validates :country,:state,:city,:area,:address_type,:postal_code,presence:true
end
