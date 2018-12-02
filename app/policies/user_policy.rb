class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    @current_user.try(:admin) || current_user.try(:id) == user.id
  end
end