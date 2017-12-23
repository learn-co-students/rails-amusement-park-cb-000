class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: user_params[:name])
    if user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), alert: 'Sign in successful!'
    else
      redirect_to signin_path, alert: 'Sign in failed. Please check the details you entered are correct.'
    end
  end

  def destroy
    session.clear
    redirect_to root_path, alert: 'Successfully signed out.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end