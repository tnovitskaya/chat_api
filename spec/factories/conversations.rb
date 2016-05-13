FactoryGirl.define do
  factory :conversation do
    association :recipient, factory: :user
    association :message
  end
end
