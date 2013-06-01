class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :network
  has_many :posts, :inverse_of => :topic, :dependent => :destroy
  has_many :subscriptions, :as => :subscribable
  attr_accessible :name, :network_id, :content, :tag_list, :is_approved, :is_featured
  validates_presence_of :name, :content, :tag_list
  acts_as_taggable
end
