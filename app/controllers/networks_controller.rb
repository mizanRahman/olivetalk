class NetworksController < ApplicationController
	
	add_breadcrumb :index, :networks_path

	def index	
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
end
