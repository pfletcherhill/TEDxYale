class ApplicationQuestionsController < ApplicationController
  
  def create
    @question = ApplicationQuestion.new(params[:application_question])
    if @question.save
      redirect_to @question.application_cycle
    else
      redirect_to "/application_cycles/#{@question.application_cycle.id}/new_question"
    end
  end
  
  def edit
    @question = ApplicationQuestion.find(params[:id])
    @application_cycle = @question.application_cycle
  end
  
  def update
    @question = ApplicationQuestion.find(params[:id])
    if @question.update_attributes(params[:application_question])
      redirect_to @question.application_cycle
    else
      render :edit
    end
  end
  
end
