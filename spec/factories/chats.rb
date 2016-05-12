FactoryGirl.define do
  factory :chat do
    name { FFaker::Company.name }
    association :message
    association :user
  end
end
