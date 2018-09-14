class RidesController < ApplicationController
  # def new
  #   @attraction = Attraction.find(params[:attraction_id])
  #   @user = current_user
  #   @user.tickets -= @attraction.tickets
  #   @user.happiness += @attraction.happiness_rating
  #   @user.nausea += @attraction.nausea_rating
  #   @user.save
  #   redirect_to user_path(current_user)
  # end

  def new
    @ride = Ride.create(
      :user_id => params[:user_id],
      :attraction_id => params[:attraction_id]
    )
    @message = @ride.take_ride
    redirect_to user_path(@ride.user, :message => @message)
  end
end
