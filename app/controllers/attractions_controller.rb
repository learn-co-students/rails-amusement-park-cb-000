class AttractionsController < ApplicationController
  before_action :find_attraction!, only: %i(show edit update)

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    attraction = Attraction.new
    render partial: 'form', locals: { attraction: attraction }
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction), alert: 'Attraction successfully created.'
  end

  def edit
    render partial: 'form', locals: { attraction: @attraction }
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction), alert: 'Attraction successfully updated'
  end

  private

  def attraction_params
    params.require(:attraction).permit(:happiness_rating, :min_height, :name, :nausea_rating, :tickets)
  end

  def find_attraction!
    @attraction = Attraction.find(params[:id])
  end
end 