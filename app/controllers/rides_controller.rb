class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    error_message = @ride.try(:take_ride)
    if @ride && error_message.empty?
      @ride.save
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
      redirect_to user_path(@ride.user)
    elsif error_message
      flash[:alert] = error_message
      redirect_to user_path(@ride.user)
    else
      flash[:alert] = "Unable to ride.  Are you logged in?"
      redirect_to attractions_path
    end
  end

  private
    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end
end