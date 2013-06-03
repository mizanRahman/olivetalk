class Subscription < ActiveRecord::Base
  belongs_to :subscribable, :polymorphic => true
  belongs_to :user
  has_many :notifications
  # attr_accessible :title, :body

  def self.subscribe(subscribable,user)
  	subscription   = Subscription.where('user_id'=> user.id).first
  	subscription ||= Subscription.new
	subscription.subscribable = subscribable
	subscription.user = user
	subscription.save
  end
end
