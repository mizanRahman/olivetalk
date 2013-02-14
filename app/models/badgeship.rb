class Badgeship < ActiveRecord::Base
  belongs_to :user
  belongs_to :badge
  attr_accessible :user_id, :badge_id
end
