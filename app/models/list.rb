class List < ActiveRecord::Base
  
  attr_accessible :name, :about
  
  has_many :users
  has_many :speakers
  
  def members
    users + speakers
  end
  
end
