class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
  add_breadcrumb "Home", :root_path
  add_breadcrumb :index, :topics_path

  load_and_authorize_resource :except => :index
  
  def index

	  if params[:tag]
    	@topics = Topic.tagged_with(params[:tag])
  	else
   		@topics = Topic.where('is_approved = ?', true)
  	end
    authorize! :read, @topics

  	@newtopic = Topic.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    # @topic = Topic.find(params[:id])
    # authorize! :read, @topics

    @posts = @topic.posts
	@newpost = Post.new
	@newresource = Resource.new
	@ownerresources = Resource.where('topic_id = ? and user_id = ?', @topic.id, @topic.user.id)
	@userresources = Resource.where('topic_id = ? and user_id != ?', @topic.id, @topic.user.id)
	add_breadcrumb @topic.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
  	add_breadcrumb :new, :topics_path
    # @topic = Topic.new
    # authorize! :manage, @topics

    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    # @topic = Topic.find(params[:id])
    # authorize! :manage, @topics

  end

  # POST /topics
  # POST /topics.json
  def create
    # @topic = Topic.new(params[:topic])
    # authorize! :create, @topics

    
    @topic.user_id = current_user.id
    @topic.last_poster_id = current_user.id
    @topic.last_post_at = Time.now
    
    Subscription.subscribe(@topic,current_user) 
    
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    # @topic = Topic.find(params[:id])
    # authorize! :manage, @topics


    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    # @topic = Topic.find(params[:id])
    # authorize! :manage, @topics

    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end
  
  def approve
  	@topic = Topic.find(params[:id])
  	@topic.is_approved = true
  	@topic.save
  	redirect_to @topic
  end
end
