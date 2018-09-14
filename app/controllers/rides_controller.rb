class RidesController < ApplicationController
  def new
    @attraction = Attraction.find(params[:attraction_id])
    redirect_to user_path(current_user)
  end
end
