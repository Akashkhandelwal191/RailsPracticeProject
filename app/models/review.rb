class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :description, :rating, presence:true
  has_many_attached :review_images
  has_one_attached :video_clip
end
