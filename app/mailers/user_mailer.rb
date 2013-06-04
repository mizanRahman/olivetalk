class UserMailer < ActionMailer::Base

  default from: "dev.mizan.rahman@gmail.com"


  def welcome_email(user)
  	@name = user.profile.first_name = "kahan"
  	user.email = "dev.mizan.rahman@gmail.com" #over riding for restricting mass email
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
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
