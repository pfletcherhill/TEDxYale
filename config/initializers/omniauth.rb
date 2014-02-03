OmniAuth.config.logger = Rails.logger

unless Rails.env.production?
  credentials = YAML.load_file("#{Rails.root}/config/credentials.yml")
  ENV['FACEBOOK_APP_ID'] = credentials['FACEBOOK_APP_ID']
  ENV['FACEBOOK_SECRET'] = credentials['FACEBOOK_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], scope: "email"
end