class Event < ActiveRecord::Base
  has_many :attendees
  has_many :users, :through => :attendees
  has_many :presenters
  has_many :speakers, :through => :presenters
  
  has_attached_file :header, 
    :styles => { :large => "660x" },
    :storage => :s3,
        :bucket => ENV['S3_BUCKET_NAME'],
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
        }
  has_attached_file :thumbnail, 
    :styles => { :medium => "300x200", :small => "150x100"},
    :storage => :s3,
        :bucket => ENV['S3_BUCKET_NAME'],
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
        }
end
