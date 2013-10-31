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
  ENV['SENDGRID_USERNAME'] = credentials['SENDGRID_USERNAME']
  ENV['SENDGRID_PASSWORD'] = credentials['SENDGRID_PASSWORD']
  ENV['speaker_application_cycle'] = credentials['speaker_application_cycle']
  ENV['nominate_application_cycle'] = credentials['nominate_application_cycle']
end

# Mailer method
ActionMailer::Base.smtp_settings = {
:user_name => ENV['SENDGRID_USERNAME'],
:password => ENV['SENDGRID_PASSWORD'],
:domain => "tedxyale.com",
:address => "smtp.sendgrid.net",
:port => 587,
:authentication => :plain,
:enable_starttls_auto => true
}