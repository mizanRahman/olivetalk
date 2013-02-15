class ApplicationController < ActionController::Base
  
  protect_from_forgery
  #check_authorization
  
  def check_for_profile
  
		if !Profile.find_by_user_id(current_user.id) then
			redirect_to :controller => :profiles, :action => :new
		end
  
  end
  
 rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :alert => exception.message
  end

end
