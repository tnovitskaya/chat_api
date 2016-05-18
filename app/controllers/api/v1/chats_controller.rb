class Api::V1::ChatsController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json
  
  def index
    respond_with current_user.chats.all.as_json
  end

  def show
    chat = current_user.chats.find(params[:id])
    render json: chat.as_json, status: 200
  end

  def create
    chat = Chat.new(chat_params)
    if chat.save
      render json: chat.as_json, status: 200
    else
      render json: { errors: chat.errors }, status: 400
    end
  end

  def update
    chat = current_user.chats.find(params[:id])
    if chat.update(chat_params)
      render json: chat.as_json, status: 200
    else
      render json: { errors: chat.errors }, status: 400
    end
  end

  def destroy
    chat = current_user.chats.find(params[:id])
    chat.destroy
    head 204
  end

  private

  def chat_params
    params.require(:chat).permit(:name, user_ids: [])
  end
end
