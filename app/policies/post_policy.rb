class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user && user.email == 'victor@victorbarbosa.com'
  end

  def new?
    user && user.email == 'victor@victorbarbosa.com'
  end

  def update?
    user && user.email == 'victor@victorbarbosa.com'
  end

  def edit?
    user && user.email == 'victor@victorbarbosa.com'
  end

  def destroy?
    user && user.email == 'victor@victorbarbosa.com'
  end
end
