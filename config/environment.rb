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

unless Rails.env.production?
  credentials = YAML.load_file("#{Rails.root}/config/credentials.yml")
  ENV['AWS_ACCESS_KEY_ID'] = credentials['AWS_ACCESS_KEY_ID']
  ENV['AWS_SECRET_ACCESS_KEY'] = credentials['AWS_SECRET_ACCESS_KEY']
  ENV['S3_BUCKET_NAME'] = credentials['S3_BUCKET_NAME']
end
