class UserPolicy < ApplicationPolicy

  def show?
    user.admin? || record.id == user.id
  end

  def edit?
    user.admin? || record.id == user.id
  end

  def create?
  end

  def destroy?
    user.admin?
  end

  def update?
    user.admin || record.id == user.id
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:id => user.id)
      end
    end
  end


end
