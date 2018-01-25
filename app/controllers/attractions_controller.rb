class AttractionsController < ApplicationController


  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @attractions = Attraction.all
    #@attractions = policy_scope(Attraction)
    render :index
  end

  def show
    @attraction = Attraction.find_by(:id => params[:id])
    render :show
  end

  def new
    @attraction = Attraction.new
    render :new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash[:errors] = @attraction.errors.full_messages
      render :new
    end
  end

  def edit
    @attraction = Attraction.find_by(:id => params[:id])
    render :edit
  end

  def update
    @attraction = Attraction.find_by(:id => params[:id])

    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  def destroy

  end

  def go_on_ride
    attraction = Attraction.find_by(:id => params[:id])
    attraction.users << current_user
    flash_message = []

    if current_user.height >= attraction.min_height && current_user.tickets >= attraction.tickets
      current_user.update_user_rates_and_tickets(attraction)
      flash_message << "Thanks for riding the #{attraction.name}!"
    end

    if current_user.height < attraction.min_height
      flash_message << "You are not tall enough to ride the #{attraction.name}!"
    end

    if current_user.tickets < attraction.tickets
      flash_message << "You do not have enough tickets to ride the #{attraction.name}!"
    end

    redirect_to user_path(current_user), flash: {:notice => flash_message}

  end

  private
  def attraction_params
    params.require(:attraction).permit(
    :name ,
    :min_height,
    :happiness_rating ,
    :nausea_rating ,
    :tickets
    )
  end

end
