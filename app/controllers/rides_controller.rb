class RidesController < ApplicationController

  def create
    @ride = Ride.new.tap do |r|
      r.attraction = Attraction.find(params[:attraction_id])
      r.user = current_user
    end
    @ride.save
    flash[:notice] = @ride.take_ride
    redirect_to user_path(current_user)
  end

end
