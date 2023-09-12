class WishList < ApplicationRecord
  has_and_belongs_to_many :products , uniq:true
  belongs_to :user
  validates_uniqueness_of :wish_list_id, :scope => [:wish_list_id, :product_id]
end
