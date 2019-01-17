class UsersController < ApplicationController

  def new
    #establish @user as a new instance of the User class
    @user = User.new
  end

  def create
    #establish @user as a new user, with the values given to it in the /new form.
    @user = User.create(user_params)
    #if the user is able to be created, create a new session for the user and send them to the user show page.
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      #if user cannot be created, give them a message saying they were not created, and send them back to the signup page
      flash[:alert] = "Unable to sign up."
      render 'users/new'
    end
  end

  def show
    #establish @user by searching on the ID submitted through the form.
    @user = User.find(params[:id])
    #if user is not permitted to see the Show page, send them back to the home page.
    if !policy(@user).show?
      return redirect_to root_path
    end
  end
  #always call private before user_params method
  private
  def user_params
    #require all of the fields for the User class.
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end
