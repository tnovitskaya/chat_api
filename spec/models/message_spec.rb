require 'spec_helper'

describe Message do
  let(:message) { FactoryGirl.build :message }
  subject { message }

  it { should respond_to(:text) }
  it { should respond_to(:sender_id) }
  it { should respond_to(:recipient_id) }
  it { should respond_to(:readed_by_users) }
  it { should respond_to(:chat_id) }

  it { should validate_presence_of :text }
  it { should validate_presence_of :sender_id }
  it { should validate_presence_of :recipient_id }
  it { should validate_presence_of :chat_id }

  it { should belong_to :sender }
  it { should have_many :recipients }
  it { should belong_to :chat }
end
