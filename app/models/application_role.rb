class ApplicationRole < ActiveRecord::Base
  
  attr_accessible :name
  
  has_many :application_questions
  
end
