class Subscription < ActiveRecord::Base
  belongs_to :subscribable, :polymorphic => true
  belongs_to :user
  # attr_accessible :title, :body

  def self.subscribe(subscribable,user)
	s=Subscription.new
	s.subscribable = subscribable
	s.user = user
	s.save
  end
end
