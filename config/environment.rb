# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TEDxYale::Application.initialize!

#Mailer method
ActionMailer::Base.smtp_settings = {
:user_name => "teamtedxyale",
:password => "gripa2013",
:domain => "tedxyale.com",
:address => "smtp.sendgrid.net",
:port => 587,
:authentication => :plain,
:enable_starttls_auto => true
}
