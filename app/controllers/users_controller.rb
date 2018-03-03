class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.last(15)
    json_response(extract_response_attributes(@users))
  end

  def create
    @user = User.create!(user_params)
    json_response(extract_response_attributes([@user]))
  end

  def show
    json_response(extract_response_attributes([@user]))
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # whitelist params
    params.permit(:name, :id)
  end

  def extract_response_attributes(users)
    users.map do |user|
      { name: user.name, id: user.id }
    end
  end
end
