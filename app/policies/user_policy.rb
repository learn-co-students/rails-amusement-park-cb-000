class UserPolicy
  attr_reader :current_user, :user

  #establish the values of the current user and user variables, as submitted
  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end
  #only allow an admin or the user themself to see the "Show" page of a user
  def show?
    @current_user.try(:admin) || @current_user.try(:id) == user.id
  end
end
