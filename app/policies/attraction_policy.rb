class AttractionPolicy < ApplicationPolicy

  def show?
  end

  def new
    user.admin?
  end

  def create?
    user.amdin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end


  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:rides).where('rides.user_id' => user.id)
      end
    end

  end

end
