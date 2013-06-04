class UserMailer < ActionMailer::Base

  default from: "dev.mizan.rahman@gmail.com"


  def notification_email(notification)
  	@notification = notification
    @notification.user.email = "dev.mizan.rahman@gmail.com" #over riding for restricting mass email
    
    mail(
      :to => @notification.user.email, 
      :subject => "Olivetalk Notifications"
      )
  end


  def test_email
    mail(
    	:to => 		"dev.mizan.rahman@gmail.com", 
    	:from => 	"dev.mizan.rahman@gmail.com",
    	:subject => "Welcome to My Awesome Site",
    	:body => 	"Hello I am mizan rahman" 
    	)

  end

end
