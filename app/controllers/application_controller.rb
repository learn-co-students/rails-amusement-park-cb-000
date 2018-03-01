class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :signed_in?, :current_user, :current_attraction

  def set_user
    @user = User.find_by(id: params[:id])
    @user ||= User.new
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def signed_in?
    session[:user_id] ? true:false
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def current_attraction
    Attraction.find_by(id: session[:attraction_id])
  end

  def admin_only
    current_user.admin
  end
end
