class ApplicationPolicy
  attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def index?
    false
  end

  def show?
    scope.where(:id => bookmark.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (bookmark.user == user)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (bookmark.user == user)
  end

  def scope
    Pundit.policy_scope!(user, bookmark.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
