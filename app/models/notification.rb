class Notification < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :user
  attr_accessible :activity_type, :object_type, :object_url, :time_sent

  def self.addnew(subscribable, user, activity_type, object_type, object_url, time_sent)
  	subscribable.subscriptions.each do |subscription|
  		@noti = Notification.new
  		@noti.subscription = subscription
  		@noti.user = user

  		@noti.activity_type=activity_type
  		@noti.object_type=object_type
  		@noti.object_url=object_url
  		@noti.time_sent=time_sent

  		@noti.save
  	end
  end


end
