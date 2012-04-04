class UserMailer < ActionMailer::Base
  default :from => "info@tedxyale.com"
 
  def welcome_email(user)
    @user = user
    @url  = "http://tedxyale.com"
    mail(:to => user.email, :subject => "TEDxYale Salon Confirmation")
  end
end
