class ApplicationsController < ApplicationController
  
  before_filter :require_login, only: [:show]
  
  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_admin
  end
  
  def new
    @application_cycle = ApplicationCycle.find_by_slug(params[:slug])
    if !@application_cycle.end_date || (@application_cycle.end_date > DateTime.now())
      @application = Application.new
    else
      render :over
    end
  end
  
  def create
    @application = Application.new(params[:application])
    respond_to do |format|
      if @application.save
        format.html { redirect_to '/', notice: 'Thank you for applying, #{@application.name}.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @application = Application.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @application }
    end
  end
end
