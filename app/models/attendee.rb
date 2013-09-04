class Attendee < ActiveRecord::Base
  
  belongs_to :user, :foreign_key => :user_id
  belongs_to :event, :foreign_key => :event_id
  
  validates_uniqueness_of(:user_id, :scope => :event_id)
  
end
