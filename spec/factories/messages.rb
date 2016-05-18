FactoryGirl.define do
  factory :message do
    text { FFaker::Lorem.paragraph }
    # readed_by_users [1, 2]
    association :user
    association :chat
  end
end
