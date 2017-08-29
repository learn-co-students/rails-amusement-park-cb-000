class UsersController < ApplicationController
  before_action :authorize, only: [:show]      
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
