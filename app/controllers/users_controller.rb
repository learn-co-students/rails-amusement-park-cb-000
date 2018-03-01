class UsersController < ApplicationController

  def index
  end

  def show
#    @message = session[:message] if session[:message]
    if signed_in? && set_user == current_user
      render 'show'
    else
      redirect_to root_path
    end
  end

  def new
    set_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
  end

  def ride
#    session[:message] = Ride.create(user_id: current_user.id, attraction_id: current_attraction.id).take_ride
    flash["alert"] = Ride.create(user_id: current_user.id, attraction_id: current_attraction.id).take_ride
    redirect_to user_path(current_user)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :height, :nausea, :happiness, :tickets, :admin)
  end
end
