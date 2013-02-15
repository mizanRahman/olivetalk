class NetworksController < ApplicationController
	
	add_breadcrumb :index, :networks_path

	def index	
		@json = Profile.all.to_gmaps4rails do |profile, marker|
		
			badgetext = ""
			profile.user.badgeships.each do |badgeship|
				badgetext = badgetext + "<span class='label label-success' style='margin-right:5px'> " + badgeship.badge.name + "</span>"
			end
			
			thewindow = "<div><span style='font-weight:bold;font-size:18px'>" + profile.first_name + " " + profile.last_name + "</span><br />" + profile.title + "<br /><br />" + badgetext + "<br /><br /><a href='" + profile_path(profile) + "' class='btn'>Learn more about " + profile.first_name + "</a></div>"
			marker.infowindow thewindow
			marker.picture({
                  :picture => profile.avatar_url(:tiny),
                  :width   => 35,
                  :height  => 35
                 })
			marker.title   "i'm the title"
			marker.sidebar "i'm the sidebar"
		end
		
		 		
		respond_to do |format|
			format.html { render :action => :index }
		end
	

	end
	
	def new
		@network = Network.new
		respond_to do |format|
			format.html { render :action => :new }
		end
	end
	
	def create
		@network = Network.new(params[:forum])

   	 	respond_to do |format|
   		   if @network.save
    	    format.html { redirect_to :action => index, :notice => 'Network was successfully created.' }
   		 	format.json { render :json => @network, :status => :created, :location => @network }
  	    else
  	      format.html { render :action => :new }
  	      format.json { render :json => @network.errors, :status => :unprocessable_entity }
 	     end
 	   end
 	end
 	
 	def map
 		@network = Network.new(params[:id])
 		
 	
 	end
end
