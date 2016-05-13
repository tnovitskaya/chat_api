require 'spec_helper'

RSpec.describe Api::V1::MessagesController, type: :controller do

  describe "GET #index" do
    before(:each) do
      4.times { FactoryGirl.create :message }
      get :index
    end

    it "returns 4 messages from the database" do
      messages_response = json_response
      expect(messages_response[:messages]).to have(4).items
    end

    it { should respond_with 200 }
  end

  describe "GET #show" do
    before(:each) do
      @message = FactoryGirl.create :message
      get :show, id: @message.id
    end

    it "returns the information about a reporter on a hash" do
      message_response = json_response
      expect(message_response[:text]).to eql @message.text
    end

    it { should respond_with 200 }
  end

end
