class WikiPolicy < ApplicationPolicy
  def update?
    user.present?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user
        if user.role == "admin"
          wikis = scope.all
        elsif user.role == "premium"
          scope.all.each do |wiki|
            if wiki.public? || wiki.owner == user || wiki.users.include?(user)
              wikis << wiki
            end
          end
        else #standard
          scope.all.each do |wiki|
            if wiki.public? || wiki.users.include?(user)
              wikis << wiki
            end
          end
        end
      else
        scope.all.each do |wiki|
          if wiki.public?
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end
