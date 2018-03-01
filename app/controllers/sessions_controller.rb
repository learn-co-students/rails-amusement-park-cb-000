class SessionsController < ApplicationController

  def index
    set_user
  end

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    if current_user == set_user
      session.clear
    end
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:password, :name)
  end


end
