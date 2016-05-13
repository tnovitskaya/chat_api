FactoryGirl.define do
  factory :user_and_chat_link do
    association :user
    association :chat
  end
end
