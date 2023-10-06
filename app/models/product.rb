class Product < ApplicationRecord
	belongs_to :category
	has_and_belongs_to_many :wish_lists 
	has_many :reviews,dependent: :destroy
	has_many_attached :product_images
	validates :product_name, :product_description, :product_price, :product_quantity, :offer, presence:true
end
