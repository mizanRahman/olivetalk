class Notification < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :user
  belongs_to :sender, :class_name => "User"  
  attr_accessible :activity_type, :object_type, :object_url,:unread, :sender_id, :time_sent

  def self.addnew(subscribable, user, activity_type, object_type, object_url, time_sent)
  	subscribable.subscriptions.each do |subscription|
	  	if(subscription.user!=user)
	  		@noti = Notification.new
	  		@noti.subscription = subscription
	  		@noti.sender = user
	  		@noti.user = subscription.user

	  		@noti.activity_type=activity_type
	  		@noti.object_type=object_type
	  		@noti.object_url=object_url
	  		@noti.time_sent=time_sent
	  		@noti.unread=true
	  		@noti.save

	  		UserMailer.notification_email(@noti).deliver 

	  	end

  	end
  end



end
