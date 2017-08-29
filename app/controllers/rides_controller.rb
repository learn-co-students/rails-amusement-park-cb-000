class RidesController < ApplicationController
  def new
    ride = Ride.new(ride_params)
    message = ride.take_ride
    if message == "Thanks for riding the #{ride.attraction.name}!"
      ride.save
    end
    
    flash[:notice] = message
    redirect_to user_path(ride.user)
  end
  

  private
    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end
    
end
