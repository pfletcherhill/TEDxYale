class UserMailer < ActionMailer::Base
  default from: "team@tedxyale.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://tedxyale.com/login"
    mail(:to => user.email, :subject => "Welcome to TEDxYale")
  end
  
  def notify_admin_email(user)
    @user = user
    mail(:to => "curator@tedxyale.com", :subject => "#{user.name} joined TEDxYale")
  end
  
  def promote_email(user)
    @user = user
    mail(:to => user.email, :subject => "You've been promoted to admin")
  end
end
