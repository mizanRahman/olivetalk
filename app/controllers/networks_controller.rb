class NetworksController < ApplicationController
	
	add_breadcrumb :index, :networks_path

	def index	
		@json = Profile.all.to_gmaps4rails do |profile, marker|
		
			badgetext = ""
			profile.user.badgeships.each do |badgeship|
				badgetext = badgetext + "<a class='label label-success' style='margin-right:5px' href='" + badge_path(badgeship.badge) + "'>" + badgeship.badge.name + "</a>"
			end
			
			thewindow = "<div style='width:350px'><div style='float:left;margin-right:10px;height:75px'><img src='" + profile.avatar_url(:thumb).to_s + "' style='width:60px' /></div><span style='font-weight:bold;font-size:18px'>" + profile.first_name.to_s + " " + profile.last_name.to_s + "</span><br />" + profile.title.to_s + "<br /><br />" + badgetext.to_s + "<br /><br /><a href='" + profile_path(profile).to_s + "' class='btn'>Learn more about " + profile.first_name.to_s + "</a></div>"
			marker.infowindow thewindow
		end
		
		@profiles = Profile.all
		
		 		
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
