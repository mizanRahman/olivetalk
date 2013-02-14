class CommunityController < ApplicationController
	add_breadcrumb :index, :community_path

	def index	
		respond_to do |format|
			format.html { render :action => :index }
		end
	end
	
end
