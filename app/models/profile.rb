class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  has_many :degrees
  attr_accessible :about_me, :blog_url, :city, :conflict, :country, :facebook_url, :first_name, :last_name, :state, :twitter_url, :user_id, :avatar
  mount_uploader :avatar, AvatarUploader
  
  
  
  def title
  
  	# FIND IF THERE IS A CURRENT DEGREE IN PROGRESS "STUDENT AT __"
  	# IF NO CURRENT DEGREE, FIND IF THERE IS CURRENT JOB "POSITION AT ORG"
  	# IF THERE IS NO CURRENT JOB, FIND IF THERE IS A PAST DEGREE "GRADUATE FROM __"
  	# IF ALL ELSE FAILS, SIMPLY WRITE THE JOIN DATE
  	
  	@LastDegree = self.degrees.order('end_date DESC').first
  	@LastJob = self.jobs.first
  	  	
  	if (@LastDegree.end_date > Date.today) then
  		return "Student at " + @LastDegree.university.name
  	elsif (@LastJob.is_current)
  		return @LastJob.position + " at " + @LastJob.organization
  	elsif (@LastDegree)
  		return "Graduate of " + @LastDegree.university.name
  	end
  end
  
end

