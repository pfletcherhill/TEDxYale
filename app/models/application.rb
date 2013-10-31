class Application < ActiveRecord::Base
  
  attr_accessible :name, :email, :bio, :affiliation, :year, 
                  :major, :hometown, :application_cycle_id, :emailed
  
  belongs_to :application_cycle
  has_many :application_answers
  
  validates_presence_of :name, :email, :application_cycle_id
  validates_presence_of :affiliation, :year, unless: :is_nomination?
  
  def is_nomination?
    return true if application_cycle_id.to_i == ENV['nominate_application_cycle'].to_i
    return false
  end
end
