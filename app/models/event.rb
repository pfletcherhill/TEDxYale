class Event < ActiveRecord::Base
  has_many :attendees
  has_many :users, :through => :attendees
  has_many :presenters
  has_many :speakers, :through => :presenters
  
  has_attached_file :header, :styles => { :large => "660x" }
  has_attached_file :thumbnail, :styles => { :medium => "300x200", :small => "150x100"}
end
