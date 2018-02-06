class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]
  before_action :set_user

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def create
    @attraction = Attraction.create(attraction_params(:name, :tickets, :nausea_rating, :happiness_rating, :min_height))
    redirect_to attraction_path(@attraction)
  end

  def update
    @attraction.update(attraction_params(:name, :tickets, :nausea_rating, :happiness_rating, :min_height))
    redirect_to attraction_path(@attraction)
  end

  private

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params(*args)
    params.require(:attraction).permit(*args)
  end
end
