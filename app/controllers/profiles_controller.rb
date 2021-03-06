class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json
  add_breadcrumb "Home", :root_path

  add_breadcrumb "Community", "/community"
  # load_and_authorize_resource
  load_and_authorize_resource :only => [:index, :new, :edit, :destroy]
  
  def index
    # @profiles = Profile.all
    # authorize! :read, @profiles
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  	if(params[:id])
   		 @profile = Profile.find(params[:id])
   	else
   		@profile = Profile.find_by_user_id(current_user.id)
   	end
    # authorize! :show, @profile

    add_breadcrumb @profile.first_name + " " + @profile.last_name, ""
    
    @recentposts = Post.where('user_id = ?', @profile.user.id).order('id desc')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    # @profile = Profile.new
    # authorize! :new, @profile
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    # @profile = Profile.find_by_user_id(current_user.id)
    # authorize! :edit, @profile

  	add_breadcrumb "My Profile", profile_path(@profile)
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])
    @profile.user_id = current_user.id
    authorize! :create, @profile
    
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find_by_user_id(current_user.id)
    authorize! :update, @profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    # @profile = Profile.find(params[:id])
    # authorize! :destroy, @profile

    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
  
end
