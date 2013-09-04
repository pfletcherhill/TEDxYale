class ApplicationAnswer < ActiveRecord::Base
  
  attr_accessible :application_question_id, :application_id, :content
  
  belongs_to :application
  belongs_to :application_question
  
end
