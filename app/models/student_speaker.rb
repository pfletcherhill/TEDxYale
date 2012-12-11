class StudentSpeaker < ActiveRecord::Base
  
  has_many :votes
  
  validates_presence_of :thumbnail, :talk, :name, :youtube
  
  has_attached_file :thumbnail, 
    :styles => { :medium => "400x225", :small => "150x100"},
    :storage => :s3,
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
          :bucket => ENV['S3_BUCKET_NAME']
        }
  
  def as_json
    {
      "id" => id,
      "name" => name,
      "talk" => talk,
      "youtube" => youtube,
      "thumbnail" => thumbnail.url(:medium),
      "description" => description,
      "votes" => votes.count
    }
  end
        
end
