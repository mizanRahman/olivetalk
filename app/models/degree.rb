class Degree < ActiveRecord::Base
  belongs_to :profile
  belongs_to :university
  attr_accessible :primary_focus, :secondary_focus, :type_of_degree, :profile_id, :university_id, :is_current, :graduation_year
  validates_presence_of :graduation_year
end
