class University < ActiveRecord::Base
  attr_accessible :abbreviated_name, :name, :zipcode
  has_many :degrees
end
