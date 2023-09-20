class Address < ApplicationRecord
  belongs_to :user
  enum :address_type, [:home,:work,:other],default: :home
end
