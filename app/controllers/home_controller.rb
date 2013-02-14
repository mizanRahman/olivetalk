class HomeController < ApplicationController

	def index
		@topicsfeatured = Topic.find(:all, :order => "id desc", :limit => 1)
		@resources = Resource.find(:all, :order => "id desc", :limit => 3)
		respond_to do |format|
			format.html { render :action => :index }
		end
	end
	
end
