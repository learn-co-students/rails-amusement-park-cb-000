class RidesController < ApplicationController
  before_action :current_user

  def new
    ride = Ride.create(ride_params)
    flash[:message] = ride.take_ride
    redirect_to user_path(ride.user)
  end

  private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end  
end
