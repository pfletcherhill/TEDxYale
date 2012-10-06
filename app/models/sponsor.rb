class Sponsor < ActiveRecord::Base
  has_many :sponsorships
  has_many :events, :through => :sponsorships
  
  has_attached_file :thumbnail, 
    :styles => { :medium => "320x" },
    :storage => :s3,
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
          :bucket => ENV['S3_BUCKET_NAME']
        }
  
  validates_presence_of :name
end
