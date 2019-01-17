class SessionsController < ApplicationController
  def new
    #establish @user as a new iteration of the User class
    @user = User.new
  end

  def create
    #establish @user as the user entered in the login form
    @user = User.find_by(name: user_params[:name])
    #check to ensure the correct password is entered
    if @user.authenticate(user_params[:password])
      #assign the session the correct user ID if the pw and un are correct
      session[:user_id] = @user.id
      #redirect the user to the user home page
      redirect_to user_path(@user)
    else
      #if the UN or PW doesn't work, let the user know, then send them back to the login page
      flash[:alert] = "Invalid name or password"
      render 'sessions/new'
    end
  end

  def destroy
    #destroy the session
    session.clear
    #send user back to login
    redirect_to root_path
  end

  def user_params
    #allow input of name and password in login form
    params.require(:user).permit(:name, :password)
  end

end
