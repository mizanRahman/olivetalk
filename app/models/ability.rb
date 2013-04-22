class Ability
  include CanCan::Ability

  def initialize(user)
	user ||= User.new # guest user (not logged in)
	if user.role == "admin"
		can :manage, :all
		can :access, :rails_admin
		can :dashboard  
	elsif user.role == "moderator"
		can :read, :all
		can :update, :all
		can :destroy, :all
		can :create, :all
		can :approve, Topic
	elsif user.role == "member"
		can :read, Topic, :is_approved => true
		can :create, [Topic, Post, Profile]
		# can :destroy, [Post, Resource], :user_id => current_user.id
	elsif user.role == ""
		cannot :manage, :all
		can :manage, :profile
	else
		cannot :manage, :all
	end
  end
end
