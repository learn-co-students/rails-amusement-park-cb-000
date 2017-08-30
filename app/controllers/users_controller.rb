class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create


    @user = User.create(user_params)
    if @user.present?
    session[:user_id] = @user.id

     redirect_to "/users/#{@user.id}"
   else

     flash[:alert] = "Could not create account."
     redirect_to "/users/new"
   end
  end

  def show

    if current_user
    @user = User.find(params[:id])
binding.pry
      if params[:attraction].present?
        @attraction =  Attraction.find(params[:attraction][:id])
        @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)

        @ride.take_ride
        @user.save
      end
binding.pry
    else
      redirect_to root_path
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :happiness, :nausea, :tickets, :height, :password, :admin)
  end

end
