class ApplicationCyclesController < ApplicationController
  
  respond_to :html, :json
  
  def show
    @application_cycle = ApplicationCycle.find(params[:id])
    respond_with @application_cycle
  end
  
  def new
    @application_cycle = ApplicationCycle.new
  end
  
  def create
    @application_cycle = ApplicationCycle.new(params[:application_cycle])
    if @application_cycle.save
      redirect_to "/admin/applications"
    else
      render :new
    end
  end
  
  def new_question
    @application_cycle = ApplicationCycle.find(params[:id])
    @question = ApplicationQuestion.new
  end
  
end
