class UsersController < ApplicationController

  def new
  end

  def index
    authorize User
    @user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
    authorize @user
  end

  def update
    @user = User.find_by(id: params[:id])
    authorize @user
    @user.update(permitted_attributes(@user))
  end

  def destroy
    @user = User.find_by(id: params[:id])
    authorize @user
    @user.destroy
  end
end
