class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Error when creating an account!"
      render :new
    end
  end

  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name,:height,:happiness,:nausea,:tickets,:password,:admin)
  end
end
