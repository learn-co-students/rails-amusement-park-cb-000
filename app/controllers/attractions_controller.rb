class AttractionsController < ApplicationController
  def index
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @user = User.find(session[:user_id])
  end
end
