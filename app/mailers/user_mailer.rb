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
  
  def new_app_email(email, name, app)
    @app = app
    @name = name
    mail(:to => email, :subject => "Thanks for applying")
  end
  
  def speaker_email(speaker, password)
    @speaker = speaker
    @password = password
    mail(:to => speaker.email, :subject => "TEDxYale Student Speaker Competition")
  end
  
  def ticket_email(ticket)
    @ticket = ticket
    mail(:to => @ticket.email, :subject => "TEDxYale 2013 Ticket Confirmation" )
  end
end
