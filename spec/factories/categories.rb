FactoryBot.define do
  factory :category do
    category_name {Faker::Name.name}
    category_image {Rack::Test::UploadedFile.new(Rails.root.join('spec/images/common_category.jpg'), 'photo/jpg')}
  end
end
