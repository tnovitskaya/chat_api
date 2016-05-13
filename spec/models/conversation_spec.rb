require 'spec_helper'

RSpec.describe Conversation, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:conversation)).to be_valid
  end

  it { should belong_to(:recipient).class_name(User) }
  it { should belong_to(:message).class_name(Message) }

  let(:conversation) { FactoryGirl.create(:conversation) }

  describe "when recipient is not present" do
    before { conversation.recipient_id = nil }
    it { should_not be_valid }
  end

  describe "when message is not present" do
    before { conversation.message_id = nil }
    it { should_not be_valid }
  end
end
