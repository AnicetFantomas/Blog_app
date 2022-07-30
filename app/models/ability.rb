# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= user.new

    can: read, Post, public:true
    return unless user.present? 

    can :read, Post, user:user
    can :manage, Post, user:user 
    can :manage, Comment, user:user
    return unless user.admin? 

    can :manage, :all 
  end
end
