class Ability
  include CanCan::Ability

  def initialize(user)
	user ||= User.new # guest user (not logged in)
	if user.has_role?(:admin) #or user.role == "superuser" 
		can :manage, :all
		can :read, :profile
		can :access, :rails_admin
		can :dashboard  
	elsif user.has_role?(:moderator)
		can :read, :all
		can :update, :all
		can :destroy, :all
		can :create, :all
		can :approve, Topic
	elsif user.has_role?(:member)
		can :read, Topic, :is_approved => true
		can :create, [Topic, Post, Profile]

		can [:update], Profile do |profile|  
	        profile.try(:user) == user
	    end

		# can :destroy, [Post, Resource], :user_id => current_user.id
	elsif user.roles.empty?
		cannot :manage, :all
		can :create, Profile
		can [:update], Profile do |profile|  
	        profile.try(:user) == user
	    end
	else
		cannot :manage, :all
		# can :manage, Profile

	end
  end
end
