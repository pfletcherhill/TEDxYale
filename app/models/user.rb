class User < ActiveRecord::Base
  
  attr_accessor :password
  
  before_save :encrypt_password    
	
  validates_presence_of :name  
  validates_presence_of :email 
  validates_uniqueness_of :email
	
	has_many :attendees
	has_many :events, :through => :attendees
	has_many :votes
	belongs_to :list
	
	def votes_left
	  votes = self.votes.count
	  10 - votes
	end
	
	def is_admin?
	  if self.admin == 'a'
	    true
	  else
	    false
	  end
	end
	
	def has_votes?
	  votes = self.votes.count
	  votes = 10 - votes
	  if votes > 0
	    true
	  else
	    false
	  end
	end
	
  def encrypt_password  
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
  
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      return user if user.save
      return nil
    end
  end
  
  def as_json (options = {})
    super(only: [:id, :name, :email, :affiliation, :year], methods: [:votes_left])
  end
  
end