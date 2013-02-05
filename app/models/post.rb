class Post < ActiveRecord::Base
  belongs_to :topic, :inverse_of => :posts
  belongs_to :user
  attr_accessible :content
end
