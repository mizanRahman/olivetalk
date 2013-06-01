class Notification < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :user
  attr_accessible :activity_type, :object_type, :object_url, :time_sent
end
