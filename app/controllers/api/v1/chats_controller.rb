class Api::V1::ChatsController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json
  
  def index
    result = []
    current_user.chats.all.each do |chat|
      @chat = chat
      result << render_chat
    end
    render json: result, status: 200
  end

  def show
    @chat = current_user.chats.find(params[:id])
    render json: render_chat, status: 200
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      render json: render_chat, status: 200
    else
      render json: { errors: @chat.errors }, status: 400
    end
  end

  def update
    @chat = current_user.chats.find(params[:id])
    if @chat.update(chat_params)
      render json: render_chat, status: 200
    else
      render json: { errors: @chat.errors }, status: 400
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

  def unread_messages_count
    Message.unread_by(current_user).count
  end

  def render_chat
    @chat.attributes.merge({ unread_messages_count: unread_messages_count,
                               user_ids: @chat.user_ids})
  end

end
