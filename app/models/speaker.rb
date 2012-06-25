class Speaker < ActiveRecord::Base
  has_many :presenters
  has_many :events, :through => :presenters 
  
  validates_presence_of :name
  
end
