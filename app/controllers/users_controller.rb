class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.order(wins: :desc).limit(15)
    json_response(extract_response_attributes(@users))
  end

  def create
    @user = User.create!(User_params)
    json_response(extract_response_attributes([@user]))
  end

  def show
    json_response(extract_response_attributes([@user]))
  end

  def update
    @user.update(User_params)
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
    params.permit(:name)
  end

  def extract_response_attributes(Users)
    Users.map do |User|
      { name: User.name }
    end
  end
end