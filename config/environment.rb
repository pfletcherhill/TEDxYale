# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TEDxYale::Application.initialize!

unless Rails.env.production?
  credentials = YAML.load_file("#{Rails.root}/config/credentials.yml")
  ENV['AWS_ACCESS_KEY_ID'] = credentials['AWS_ACCESS_KEY_ID']
  ENV['AWS_SECRET_ACCESS_KEY'] = credentials['AWS_SECRET_ACCESS_KEY']
  ENV['S3_BUCKET_NAME'] = credentials['S3_BUCKET_NAME']
  ENV['Stripe_Publishable_Key'] = credentials['Stripe_Publishable_Key']
  ENV['Stripe_Secret_Key'] = credentials['Stripe_Secret_Key']
  ENV['Sendgrid_User'] = credentials['Sendgrid_User']
  ENV['Sendgrid_Pass'] = credentials['Sendgrid_Pass']
end

# Mailer method
ActionMailer::Base.smtp_settings = {
:user_name => ENV['Sendgrid_User'],
:password => ENV['Sendgrid_Pass'],
:domain => "tedxyale.com",
:address => "smtp.sendgrid.net",
:port => 587,
:authentication => :plain,
:enable_starttls_auto => true
}