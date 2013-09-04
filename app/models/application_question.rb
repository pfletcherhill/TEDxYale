class ApplicationQuestion < ActiveRecord::Base
  
  attr_accessible :content, :application_cycle_id, :application_role_id
  
  belongs_to :application_cycle
  belongs_to :application_role
  
  validates :content, presence: true
  
end
