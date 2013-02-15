class Ability
  include CanCan::Ability

  def initialize(user)
	user ||= User.new # guest user (not logged in)
	if user.role == "member"
		can :manage, :all
	elsif user.role == "moderator"
		can :manage, :all
	elsif user.role == "admin"
		can :manage, :all
	elsif user.role == ""
		cannot :manage, :all
		can :manage, :profile
	else
		cannot :manage, :all
	end
  end
end
