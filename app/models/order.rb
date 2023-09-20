class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  enum :status, [:pending,:processing,:shipped,:delivered],default: :pending
  has_many :line_items_products, as: :purchasable
end
