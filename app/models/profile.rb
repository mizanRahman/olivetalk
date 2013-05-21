class Profile < ActiveRecord::Base
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  belongs_to :user
  has_many :jobs, :dependent => :destroy
  has_many :degrees, :dependent => :destroy
  attr_accessible :about_me, :blog_url, :city, :conflict, :country, :facebook_url, :first_name, :last_name, :state, :twitter_url, :user_id, :avatar, :avatar_cache, :remove_avatar
  mount_uploader :avatar, AvatarUploader
  acts_as_gmappable
  validates_length_of :about_me, :maximum => 150
  
  validates :avatar, :presence => {:message => 'You must have to provide a photo.'}
  
  def title
  
  	# FIND IF THERE IS A CURRENT DEGREE IN PROGRESS "STUDENT AT __"
  	# IF NO CURRENT DEGREE, FIND IF THERE IS CURRENT JOB "POSITION AT ORG"
  	# IF THERE IS NO CURRENT JOB, FIND IF THERE IS A PAST DEGREE "GRADUATE FROM __"
  	# IF ALL ELSE FAILS, SIMPLY WRITE THE JOIN DATE
  	
  	@LastDegree = self.degrees.order('graduation_year DESC').first
  	@LastJob = self.jobs.first
  	
  	if (@LastDegree or @LastJob) then
  	  	
	  	if (@LastDegree.is_current) then
	  		return "Student at " + @LastDegree.university.name
	  	elsif (@LastJob and @LastJob.is_current)
	  		return @LastJob.position + " at " + @LastJob.organization
	  	elsif (@LastDegree)
	  		return "Graduate of " + @LastDegree.university.name
	  	end
  	else
  		return "New Member"
  	end
  end
  
  def location
  	return self.city + ", " + self.state + " " + self.country
  end

  def gmaps4rails_address
	#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
	"#{self.city}, #{self.state} #{self.country}" 
  end
  
end

