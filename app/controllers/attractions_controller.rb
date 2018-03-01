class AttractionsController < ApplicationController
  before_action :admin_only, :only => [:new, :create, :edit, :destroy]
  before_action :set_attraction, :only => [:show, :edit, :update, :destroy]
  def index
    @attractions = Attraction.all
  end

  def show
    session[:attraction_id] = @attraction.id
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = "Attraction did not save."
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end
