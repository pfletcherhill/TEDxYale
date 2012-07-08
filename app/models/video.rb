class Video < ActiveRecord::Base
  
  has_attached_file :still, 
    :styles => { :small => "184x104" },
    :storage => :s3,
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
          :bucket => ENV['S3_BUCKET_NAME']
        }
        
  validates_presence_of :link, :title
end
