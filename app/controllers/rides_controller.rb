class RidesController < ApplicationController
  def create
    if ride_params[:min_height].to_i <= current_user.height && ride_params[:tickets].to_i <= current_user.tickets
      ride = Ride.create(ride_params)
        current_user.tickets -= ride.tickets
        current_user.happiness = ride.happiness_rating
        current_user.save
        redirect_to user_path(current_user), alert: "Thanks for riding the #{ride.name}!"
    elsif ride_params[:tickets].to_i > current_user.tickets && ride_params[:min_height].to_i <= current_user.height
      redirect_to user_path(current_user), alert: "You do not have enough tickets to ride the #{params[:name]}"
    elsif ride_params[:min_height].to_i > current_user.height && ride_params[:tickets].to_i <= current_user.tickets
      redirect_to user_path(current_user), alert: "You are not tall enough to ride the #{params[:name]}"
    else
      flash[:alert] = "You do not have enough tickets to ride the #{params[:name]} \n You are not tall enough to ride the #{params[:name]}"
      redirect_to user_path(current_user)
    end
  end

  private

  def ride_params
    params.permit(:happiness_rating, :min_height, :name, :nausea_rating, :tickets)
  end
end