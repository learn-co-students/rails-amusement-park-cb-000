class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @ride = Ride.new
  end  

  def create
    @attraction = Attraction.new(attraction_parmas)
    if @attraction.save
      redirect_to @attraction
    else
      
    end
  end

  def edit
  end

  def update
    if @attraction.update(attraction_parmas)
      redirect_to @attraction
    else
      
    end
  end

  private
    def attraction_parmas
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, 
                                         :nausea_rating, :tickets)
    end

    def set_attraction
      @attraction = Attraction.find(params[:id])
    end
end
