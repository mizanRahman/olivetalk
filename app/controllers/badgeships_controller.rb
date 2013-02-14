class BadgeshipsController < ApplicationController
  # GET /badgeships
  # GET /badgeships.json
  def index
    @badgeships = Badgeship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @badgeships }
    end
  end

  # GET /badgeships/1
  # GET /badgeships/1.json
  def show
    @badgeship = Badgeship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @badgeship }
    end
  end

  # GET /badgeships/new
  # GET /badgeships/new.json
  def new
    @badgeship = Badgeship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @badgeship }
    end
  end

  # GET /badgeships/1/edit
  def edit
    @badgeship = Badgeship.find(params[:id])
  end

  # POST /badgeships
  # POST /badgeships.json
  def create
    @badgeship = Badgeship.new(params[:badgeship])

    respond_to do |format|
      if @badgeship.save
        format.html { redirect_to @badgeship, notice: 'Badgeship was successfully created.' }
        format.json { render json: @badgeship, status: :created, location: @badgeship }
      else
        format.html { render action: "new" }
        format.json { render json: @badgeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /badgeships/1
  # PUT /badgeships/1.json
  def update
    @badgeship = Badgeship.find(params[:id])

    respond_to do |format|
      if @badgeship.update_attributes(params[:badgeship])
        format.html { redirect_to @badgeship, notice: 'Badgeship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @badgeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badgeships/1
  # DELETE /badgeships/1.json
  def destroy
    @badgeship = Badgeship.find(params[:id])
    @badgeship.destroy

    respond_to do |format|
      format.html { redirect_to badgeships_url }
      format.json { head :no_content }
    end
  end
end
