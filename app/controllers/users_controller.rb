class UsersController < ApplicationController

  include Pundit
  rescue_from Pundit::NotAuthorizedError, :with => :user_not_authorized


  def index
    @users = policy_scope(User)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to user_path(@user.id), flash: {:notice => "You've signed in successfully"}
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
      render :show
    else
      redirect_to root_path
    end 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :tickets, :height, :nausea, :happiness, :admin)
  end

end
