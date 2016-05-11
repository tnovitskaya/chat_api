require 'spec_helper'

RSpec.describe Api::V1::UsersController do
  #before(:each) { request.headers['Accept'] = "application/vnd.localhost:3000.v1" }

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:username]).to eql @user.username
    end

    it { is_expected.to respond_with 200 }
  end
end
