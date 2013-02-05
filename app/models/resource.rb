class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  attr_accessible :description, :is_approved, :read_count, :title, :url, :votes
end
