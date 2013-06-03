class UserMailer < ActionMailer::Base
  default from: "mizan.cse.buet@gmail.com"

  def welcome_email(user)
  	@name = user.profile.first_name
  	user.email = "mizan.cse.buet@gmail.com"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
