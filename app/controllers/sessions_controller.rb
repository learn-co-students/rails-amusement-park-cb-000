class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid name or password."
      render 'sessions/new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end