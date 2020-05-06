class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :user_signed_in?
  helper_method :current_user

  def user_signed_in?
    !!session[:user_id]
  end

  def require_login
    redirect_to root_path unless user_signed_in?
  end

  def check_login
    redirect_to root_path if user_signed_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
