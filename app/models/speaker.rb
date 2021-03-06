class Speaker < ActiveRecord::Base
    
  has_attached_file :thumbnail, 
    :styles => { :small => "100x100#", :large => "500x"},
    :storage => :s3,
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
          :bucket => ENV['S3_BUCKET_NAME']
        }
  
  attr_accessor :password, :password_confirmation

  before_create :generate_password   

  validates_presence_of :name  
  validates_presence_of :email 
  validates_uniqueness_of :email

  belongs_to :event
  belongs_to :list

  def generate_password
    unless self.password
      self.password = (0...8).map{65.+(rand(26)).chr}.join
    end
    if password.present?  
  		self.password_salt = BCrypt::Engine.generate_salt  
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
  	end
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def questionnaire
    if self.coming_from && !self.coming_from.empty? && self.transportation && !self.transportation.empty? && self.arrival && !self.arrival.empty? && self.housing && !self.housing.empty? && self.post_event && !self.post_event.empty? && self.diet && !self.diet.empty? && self.guest && !self.guest.empty? && self.status && !self.status.empty? && self.scheduling && !self.scheduling.empty?
      return true
    else
      nil
    end
  end
  
  def status_percentage
    tasks = Array.new
    tasks << (self.coming_from && !self.coming_from.empty? ? 1 : 0)
    tasks << (self.transportation && !self.transportation.empty? ? 1 : 0)
    tasks << (self.arrival && !self.arrival.empty? ? 1 : 0)
    tasks << (self.housing && !self.housing.empty? ? 1 : 0)
    tasks << (self.post_event && !self.post_event.empty? ? 1 : 0)
    tasks << (self.diet && !self.diet.empty? ? 1 : 0)
    tasks << (self.guest && !self.guest.empty? ? 1 : 0)
    tasks << (self.status && !self.status.empty? ? 1 : 0)
    tasks << (self.scheduling && !self.scheduling.empty? ? 1 : 0)
    tasks << (self.twitter && self.website ? 1 : 0)
    tasks << (self.thumbnail.url(:small) != "/thumbnails/small/missing.png" ? 1 : 0)
    tasks << (self.short_bio ? 1 : 0)
    tasks << (self.talk_title ? 1 : 0)
    tasks << (self.talk_about ? 1 : 0)
    tasks << (self.release_form ? 1 : 0)
    length = tasks.length
    complete = tasks.sum * 100
    return (complete / length).to_s + "%"
  end
  
  def as_json
    {
      "id" => id,
      "name" => name,
      "public" => public,
      "thumbnail" => thumbnail.url(:large) != "/thumbnails/large/missing.png" ? thumbnail.url(:large) : "",
      "bio" => short_bio, 
      "twitter" => twitter,
      "talk" => talk_title,
      "crop" => crop
    }
  end
  
end
