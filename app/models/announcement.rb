class Announcement < ActiveRecord::Base
  validates_presence_of :title
  
  has_attached_file :background, 
    :styles => { :large => "1000x" },
    :storage => :s3,
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
          :bucket => ENV['S3_BUCKET_NAME']
        }
end
