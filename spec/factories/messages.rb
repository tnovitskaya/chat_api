FactoryGirl.define do
  factory :message do
    text { FFaker::Lorem.paragraph }
    readed_by_users 0.0
    association :sender, factory: :user
    association :recipient, factory: :user
    association :chat
  end
end
