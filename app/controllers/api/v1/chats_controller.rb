class Api::V1::ChatsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Chat.all
  end

  def show
    respond_with Chat.find(params[:id])
  end
end
