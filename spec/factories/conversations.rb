FactoryGirl.define do
  factory :conversation do
    association :user
    association :chat
  end
end
