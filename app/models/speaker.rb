class Speaker < ActiveRecord::Base
  belongs_to :event
  
  validates_presence_of :name, :event_id
  
  has_attached_file :thumbnail, 
    :styles => { :small => "100x"},
    :storage => :s3,
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
          :bucket => ENV['S3_BUCKET_NAME']
        }
end
