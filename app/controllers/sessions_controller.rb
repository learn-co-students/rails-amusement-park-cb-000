class SessionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def new
    @user = User.new
    render :new
  end

  def create
    if @user = authenticate_user(user_params)
      sign_in(@user)
      redirect_to user_path(@user.id), flash: {:notice => "You've successfully signed in!"}
    else
      @user = User.new(user_params)
      flash[:error] = "Wrong username or password!"
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    sign_out(current_user)
    redirect_to root_path 
  end

  protected

  def not_found
    return head(:not_found)
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
