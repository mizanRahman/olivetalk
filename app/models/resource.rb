class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  attr_accessible :description, :title, :url, :comment, :tag_list
  acts_as_taggable
end
