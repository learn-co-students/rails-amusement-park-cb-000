class UsersController < ApplicationController
  before_action :find_user!, only: %i(show)
  before_action :authenticate_user, except: %i(index new create)

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user), alert: 'Sign up successful!'
    else
      redirect_to new_user_path, alert: 'Sign up failed. Please check your information and try again.'
    end
  end

  private

  def authenticate_user
    redirect_to root_path, alert: 'You must be logged in to do that.' unless current_user
  end

  def find_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

end