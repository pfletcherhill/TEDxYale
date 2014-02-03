class Vote < ActiveRecord::Base
  
  attr_accessible :user_id, :student_speaker_id
  
  belongs_to :user
  belongs_to :student_speaker, :counter_cache => true
  
end
