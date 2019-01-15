class AttractionsController < ApplicationController

  def index
    @user = current_user
    @attractions = Attraction.all
  end

  def show
    @user = current_user
    @attraction = Attraction.find(params[:id])
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
