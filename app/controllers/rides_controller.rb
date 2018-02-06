class RidesController < ApplicationController
  def create
    @user = User.find_by_id(session[:user_id])
    @attraction = Attraction.find_by_id(params[:id])
    @ride = Ride.create(attraction_id: @attraction.id, user_id: @user.id)
    @ride.take_ride
    if @ride.no_luck?
      flash[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @ride.short?
      flash[:message] = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif @ride.out_of_tickets?
      flash[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    else
      flash[:message] = "Thanks for riding the #{@attraction.name}!"
    end
    redirect_to user_path(@user)
  end
end
