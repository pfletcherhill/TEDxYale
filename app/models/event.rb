class Event < ActiveRecord::Base
  has_many :attendees
  has_many :users, :through => :attendees
  has_many :speakers
  has_many :sponsorships
  has_many :sponsors, :through => :sponsorships
  
  has_attached_file :header, 
    :styles => { :large => "660x" },
    :storage => :s3,
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
          :bucket => ENV['S3_BUCKET_NAME']
        }
  has_attached_file :thumbnail, 
    :styles => { :medium => "300x200#", :small => "150x100#"},
    :storage => :s3,
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
          :bucket => ENV['S3_BUCKET_NAME']
        }
end
