class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (user == record.user || user.email == 'victor@victorbarbosa.com')
  end

  def destroy?
    user.present? && (user == record.user || user.email == 'victor@victorbarbosa.com')
  end
end
