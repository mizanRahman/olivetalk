class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :network
  has_many :posts, :inverse_of => :topic, :dependent => :destroy
  attr_accessible :name, :network_id, :content, :tag_list
  acts_as_taggable
end
