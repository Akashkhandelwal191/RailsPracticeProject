FactoryBot.define do
  factory :product do
    product_name {"Pure Bottle"}
    product_description {"This is pure bottle"}
    product_price {200}
    product_quantity {10}
    offer {10}
    product_images {[Rack::Test::UploadedFile.new(Rails.root.join('spec/images/sachin.jpg'), 'photo/jpg')]}
  end
end
