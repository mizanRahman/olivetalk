class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :badgeships

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body
  
  after_create :create_new_profile
  
  def create_new_profile
  		self.role = "unapproved"
  		self.save
		@profile = Profile.new
		@profile.user_id = self.id
		@profile.city = "Los Angeles"
		@profile.state = "CA"
		@profile.country = "United States"
		@profile.save
  end

  def has_profile
  
  	if Profile.where(user_id: self.id)
  		return true
  	end
  
  end

end
