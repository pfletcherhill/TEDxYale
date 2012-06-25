class Presenter < ActiveRecord::Base
  belongs_to :speaker, :foreign_key => :speaker_id
  belongs_to :event, :foreign_key => :event_id
  
  validates_uniqueness_of(:speaker_id, :scope => :event_id)
end
