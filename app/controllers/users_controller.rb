class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :login]
  before_action :require_login, only: [:show, :edit]

  def signin
    @user = User.new
  end

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create(user_params(:name, :height, :happiness, :nausea, :tickets, :password, :admin))
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def update
    @user.update(user_params(:name, :height, :happiness, :nausea, :tickets, :password, :admin))
    redirect_to user_path(@user)
  end

  private

  def require_login
    if !session.include? :user_id
      redirect_to "/"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
