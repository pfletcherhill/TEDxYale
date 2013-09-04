class ApplicationAnswersController < ApplicationController
  
  respond_to :html, :json
  
  def create
    answer = ApplicationAnswer.new(params[:application_answer])
    if answer.save
      respond_with answer
    end
  end
    
end
