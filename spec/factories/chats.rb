FactoryGirl.define do
  factory :chat do
    name { FFaker::Company.name }
  end
end
