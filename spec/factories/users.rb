require 'faker'
FactoryBot.define do
  factory :user do
    first_name {Faker::Name.name}
    last_name {"gupta"}
    gender {"male"}
    mobile_number {"9993869873"}
    email {Faker::Internet.email}
    password {"123456"}
    user_avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/images/sachin.jpg'), 'photo/jpg') }
  end
end
