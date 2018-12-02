class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if !policy(@user).show?
      return redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Unable to sign up."
      render 'users/new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end