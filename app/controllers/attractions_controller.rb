class AttractionsController < ApplicationController
  def index
    @attraction = Attraction.new
    @user = current_user
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @user = User.find(session[:user_id])
  end


  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end
end
