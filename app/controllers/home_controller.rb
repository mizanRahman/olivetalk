class HomeController < ApplicationController

	before_filter :check_for_profile

	def index
		@topicsfeatured = Topic.where("is_approved = ? and is_featured = ?", true, true).order("id desc").limit(1)
		@recenttopics = Topic.where("is_approved = ?", true).order("id DESC").limit(3)
		@resources = Resource.find(:all, :order => "id desc", :limit => 3)
		
		respond_to do |format|
			format.html { render :action => :index }
		end

	end
	
end
