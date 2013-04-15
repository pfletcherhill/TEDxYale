class List < ActiveRecord::Base
  
  attr_accessible :name, :about
  
  has_many :users
  
end
