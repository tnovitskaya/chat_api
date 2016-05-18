class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    if params[:unreaded] == "true"
      respond_with Message.unread_by(current_user)
    else
      respond_with Message.all
    end
  end

  def show
    chat = Chat.find(params[:chat_id])
    message = chat.messages.find(params[:id])
    render json: message.as_json, status: 200
  end

  def create
    message = current_user.messages.new(message_params)
    message.chat = Chat.find(params[:chat_id])
    if message.save
      render json: message, status: 200
    else
      render json: { errors: message.errors }, status: 400
    end
  end

  def update
    message = current_user.messages.find(params[:id])
    if params[:mark_as_readed] == "true"
      message.mark_as_read! :for => current_user
      head 200
    else
      render json: { errors: message.errors }, status: 400
    end
  end

  def destroy
    message = current_user.messages.find(params[:id])
    message.destroy
    head 204
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :chat_id, :text)
  end
end
