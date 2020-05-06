class SessionsController < ApplicationController
  before_action :check_login, except: :destroy
  before_action :require_login, only: :destroy

  def new
   @user = User.new 
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = 'Info incorrect!' 
      @user ||= User.new
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
