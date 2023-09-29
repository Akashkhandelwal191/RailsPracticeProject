FactoryBot.define do
  factory :line_items_product do
    quantity {10}
    total_price {90000}
    discounted_price {85000}
  end
end
