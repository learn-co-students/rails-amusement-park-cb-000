class RidesController < ApplicationController
  def create
    @ride = Ride.create(user_id:current_user.id,attraction_id:params[:attraction_id])
    @outcome = @ride.take_ride
    if @outcome.empty?
      flash[:notice] = "Thanks for riding the #{Attraction.find(params[:attraction_id]).name}!"
    else
      flash[:error] = @outcome[6..@outcome.length]
    end
    redirect_to current_user
  end
end
