class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  def current_user
    #find the user who is going to be used by identifying the user whose session it is.
    User.find_by(id: session[:user_id])
  end
end
