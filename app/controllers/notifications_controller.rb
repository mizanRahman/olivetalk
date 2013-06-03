class NotificationsController < ApplicationController
  def index
	
  	# @notifications = Notification.joins("LEFT OUTER JOIN subscriptions ON notifications.subscription_id = subscriptions.id").where(
  	# 	'subscriptions.user_id' => current_user.id,
  	# 	'notifications.unread' => true
  	# 	)

  	@notifications=Notification.where(
  		'user_id'=>current_user.id, 
  		'unread'=>true)
  	# Notification.where('user_id'=>1,'unread'=>true)

  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notifications }
    end
    #it will be a delayed job
  	Notification.update_all({:unread => false}, {:user_id => current_user.id})


  end
end