class Category < ApplicationRecord
   has_many :products,dependent: :destroy
   validates :category_name,presence:true
   has_one_attached :category_image,dependent: :destroy
end
