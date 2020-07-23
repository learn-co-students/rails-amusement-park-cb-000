class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      redirect_to new_user_path
    end
  end

  def show
    redirect_to root_url if !logged_in?
    @user = User.find(params[:id])
  end

  def update
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end  
end
