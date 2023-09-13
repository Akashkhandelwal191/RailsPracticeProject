class Product < ApplicationRecord
	belongs_to :category
	has_and_belongs_to_many :wish_lists , uniq:true
	has_many :reviews,dependent: :destroy
	has_many_attached :product_images
end
