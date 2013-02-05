class Degree < ActiveRecord::Base
  belongs_to :profile
  belongs_to :university
  attr_accessible :end_date, :primary_focus, :secondary_focus, :start_date, :type_of_degree, :profile_id, :university_id

end
