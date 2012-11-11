class Speaker < ActiveRecord::Base
    
  has_attached_file :thumbnail, 
    :styles => { :small => "100x"},
    :storage => :s3,
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
          :bucket => ENV['S3_BUCKET_NAME']
        }
  
  attr_accessor :password

  before_create :generate_password
  #before_save :generate_password, :on => "create"    

  validates_presence_of :name  
  validates_presence_of :email 
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  validates_uniqueness_of :email

  belongs_to :event

  def generate_password
    self.password = (0...8).map{65.+(rand(26)).chr}.join
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
end
