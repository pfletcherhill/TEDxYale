class Speaker < ActiveRecord::Base
  has_many :presenters
  has_many :events, :through => :presenters 
  
  validates_presence_of :name
  
  has_attached_file :thumbnail, :styles => { :medium => "130x100" }
  
end
