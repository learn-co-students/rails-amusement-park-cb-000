class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    if !@user.authenticate(params[:user][:password])
      return head(:forbidden)
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to "/"
  end
end
