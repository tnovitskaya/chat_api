FactoryGirl.define do
  factory :message do
    text { FFaker::Lorem.paragraph }
    association :user
    association :chat
  end
end
