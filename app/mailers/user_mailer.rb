class UserMailer < ActionMailer::Base
  default from: "curator@tedxyale.com"
  
  def welcome_email(user)
      @user = user
      @url  = "http://tedxyale.com/login"
      mail(:to => user.email, :subject => "Welcome to TEDxYale")
    end
end
