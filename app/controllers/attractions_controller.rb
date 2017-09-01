class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
  #  binding.pry
    if current_user.admin?
      @attraction = Attraction.create(attraction_params)
      redirect_to "/attractions/#{@attraction.id}"
    else
      redirect_to '/attractions'
    end
  end


  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    #binding.pry
    @attraction = Attraction.find(params[:id])
    @user = current_user

  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    if current_user.admin?
      @attraction = Attraction.find(params[:id])
      @attraction.update(attraction_params)
    else
      redirect_to 'attractions'
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end

end
