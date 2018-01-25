class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :sign_in, :sign_out, :current_user, :logged_in?,
                :not_found, :authenticate_user, :user_not_authorized

  def sign_in(user)
    session[:user_id] ||= user.id
  end

  def sign_out(user)
    session.clear unless current_user != user
  end

  def current_user
    return User.find_by(:id => session[:user_id]) unless session[:user_id].blank?
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate_user(auth_options)
    if user = User.find_by(:name => auth_options[:name])
      return user.authenticate(auth_options[:password])
    else
      false
    end
  end

  def user_not_authorized
    redirect_to root_path, :flash => {:error => "You are not authorized to access this page!"}
  end

end
