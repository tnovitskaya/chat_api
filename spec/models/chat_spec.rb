require 'spec_helper'

describe Chat do
  let(:chat) { FactoryGirl.build :chat }
  subject { chat }

  it { should respond_to(:name) }

  it { should validate_presence_of :name }

  it { should have_many :users }
  it { should have_many :messages }
end
