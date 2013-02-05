class University < ActiveRecord::Base
  attr_accessible :abbreviated_name, :name, :zipcode
end
