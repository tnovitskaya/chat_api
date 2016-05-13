class Api::V1::MessagesController < ApplicationController
  respond_to :json

  def index
    respond_with Message.all
  end

  def show
    respond_with Message.find(params[:id])
  end
end
