class RidesController < ApplicationController

  def create
    #take entered values and create a new ride
    @ride = Ride.new(ride_params)
    #set variable = to an attempt to take_ride
    error_message = @ride.try(:take_ride)
    #if there is no error message, and a ride was created, save the new ride.
    
    if @ride && error_message.empty?
      @ride.save
      #give user a notice that they rode the ride after save.
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
      #send user back to their show page
      redirect_to user_path(@ride.user)
    elsif error_message
      #if there is an error message, send user to their show page without saving the ride.
      flash[:alert] = error_message
      redirect_to user_path(@ride.user)
    else
      #if the ride could not be created, ask user if they are logged in, and send them back to the attractions page.
      flash[:alert] = "Unable to ride. Are you logged in?"
      redirect_to attractions_path
    end
  end

private
#set ride_params
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
