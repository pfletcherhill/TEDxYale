class Sponsorship < ActiveRecord::Base
  belongs_to :event
  belongs_to :sponsor
  
  validates_presence_of :amount, :primary, :event_id, :sponsor_id
  
end
