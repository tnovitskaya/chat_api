FactoryGirl.define do
  factory :user do
    username { FFaker::Name.first_name }
    password "12345678"
    password_confirmation "12345678"
  end
end
