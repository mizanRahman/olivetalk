class Badge < ActiveRecord::Base
  attr_accessible :description, :name, :priority
  
  has_many :badgeships, :dependent => :destroy
end
