class ApplicationController < ActionController::Base
  
  protect_from_forgery
  #check_authorization
  before_filter :unread_count


  def unread_count
    if current_user then

      @notification_count = Notification.where(
        'user_id'=>current_user.id, 
        'unread'=>true).count
    end
  end
  
  def check_for_profile
  	if current_user then
  		if !Profile.find_by_user_id(current_user.id) then
  			redirect_to :controller => :profiles, :action => :new
  		end
  	end
  
  end

  
 rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to '/'#, :alert => exception.message
  end

end
