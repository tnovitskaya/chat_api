class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]
  respond_to :json

  def index
    respond_with User.all.as_json
  end

  def show
    respond_with User.find(params[:id]).as_json
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user.as_json, status: 200
    else
      render json: { errors: user.errors }, status: 400
    end
  end

  def update
    user = current_user

    if user.update(user_params)
      render json: user.as_json, status: 200
    else
      render json: { errors: user.errors }, status: 400
    end
  end

  def destroy
    current_user.destroy
    head 204
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
