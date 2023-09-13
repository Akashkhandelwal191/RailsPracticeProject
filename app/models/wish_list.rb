class WishList < ApplicationRecord
  has_and_belongs_to_many :products , uniq:true
  belongs_to :user
end
