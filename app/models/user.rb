class User < ActiveRecord::Base
  
  attr_accessor :password
  
  before_save :encrypt_password    
	
  validates_presence_of :name  
  validates_presence_of :email 
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  validates_uniqueness_of :email
  #validates_presence_of :password_confirmation, :on => :create
  #validates_presence_of :password, :on => :create
  #validates_confirmation_of :password  
	
	has_many :attendees
	has_many :events, :through => :attendees
	has_many :votes
	
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
  
end