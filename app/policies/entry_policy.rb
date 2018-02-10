class EntryPolicy < ApplicationPolicy
  class Scope
    attr_reader :scope, :user

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(user_id: user.id)
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    entry_belongs_to_user?
  end

  private

  def entry_belongs_to_user?
    user.id == record.user_id
  end
end
