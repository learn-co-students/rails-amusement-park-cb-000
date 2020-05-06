class UsersController < ApplicationController
  before_action :require_login, only: [:show, :ride]
  before_action :set_user, only: [:show, :ride]
  before_action :check_login, except: [:show, :ride]

  def new
    @user = User.new
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

  def ride
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.new(user: @user, attraction: @attraction)
    message = @ride.take_ride
    redirect_to @user, notice: message
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
