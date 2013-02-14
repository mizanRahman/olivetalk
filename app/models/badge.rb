class Badge < ActiveRecord::Base
  attr_accessible :description, :name, :priority
  
  has_many :users, :through => :badgeships
end
