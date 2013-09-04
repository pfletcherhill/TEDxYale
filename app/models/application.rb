class Application < ActiveRecord::Base
  
  attr_accessible :name, :email, :affiliation, :year, :major, :hometown, :application_cycle_id
  
  belongs_to :application_cycle
  has_many :application_answers
  
  validates_presence_of :name, :email, :affiliation, :year, :major, :hometown, :application_cycle_id
  
end
