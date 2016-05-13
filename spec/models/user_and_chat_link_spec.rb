require 'spec_helper'

RSpec.describe UserAndChatLink, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user_and_chat_link)).to be_valid
  end

  it { should belong_to(:user).class_name(User) }
  it { should belong_to(:chat).class_name(Chat) }
end
