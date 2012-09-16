class ApplicationsController < ApplicationController
  
  before_filter :require_login
  
  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_admin
  end
  
  def create
    @application = Application.new(params[:application])
    respond_to do |format|
      if @application.save
        format.html { redirect_to '/', notice: 'Thank you for applying, #{@application.name}.' }
        format.json { render json: @application, status: :created, location: @application }
        email = @application.email
        name = @application.name
        UserMailer.new_app_email(email, name, @application).deliver
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
