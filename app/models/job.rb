class Job < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :description, :end_date, :is_current, :organization, :position, :start_date, :profile_id
end
