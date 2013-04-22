class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  add_breadcrumb "Home", :root_path
  add_breadcrumb :index, :resources_path
  load_and_authorize_resource

    
  def index
	if params[:tag]
    	@resources = Resource.tagged_with(params[:tag])
  	else
   		@resources = Resource.order("id DESC")
  	end
  	
  	@newresource = Resource.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])
    @resource.read_count = @resource.read_count.to_i + 1
    @resource.save

    respond_to do |format|
      format.html { redirect_to @resource.url }
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(params[:resource])
    @resource.user = current_user
    if (params.has_key?(:topic_id)) then
  		@topic = Topic.find(params[:topic_id])
		@resource.topic = @topic
	end
	    
	#agent = Mechanize.new
	#page = agent.get(@resource.url)
	
	#@resource.title = page.title
	#node = page.search("head meta[name='description']")[0]
	#@resource.description = node["content"]

    respond_to do |format|
      if @resource.save
        format.html { redirect_to resources_url, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
        format.js
      else
        format.js
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to resources_url, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.js
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])


	if (@resource.topic_id) then
		url = topic_url(@resource.topic_id)
	else
		url = resources_url
	end
	
	
    @resource.destroy


    respond_to do |format|
      format.html { redirect_to url }
      format.json { head :no_content }
    end
  end
end
