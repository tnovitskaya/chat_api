require 'spec_helper'

RSpec.describe Api::V1::ChatsController, type: :controller do

  # describe "GET #index" do
  #   before(:each) do
  #     4.times { FactoryGirl.create :message }
  #     get :index
  #   end

  #   it "returns 4 messages from the database" do
  #     messages_response = json_response
  #     expect(messages_response[:messages]).to have(4).items
  #   end

  #   it { should respond_with 200 }
  # end

  describe "GET #show" do
    before(:each) do
      @chat = FactoryGirl.create :chat
      get :show, id: @chat.id
    end

    it "returns the information about a reporter on a hash" do
      chat_response = json_response
      expect(chat_response[:name]).to eql @chat.name
    end

    it { should respond_with 200 }
  end

end
