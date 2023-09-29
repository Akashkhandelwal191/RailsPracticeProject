FactoryBot.define do
  factory :product do
    product_name {"Pure Bottle"}
    product_description {"This is pure bottle"}
    product_price {200}
    product_quantity {10}
    offer {10}
  end
end
