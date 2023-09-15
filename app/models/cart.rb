class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items_products, as: :purchasable

end
