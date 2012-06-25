class AdminController < ApplicationController
  
  before_filter :require_login
  
  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_admin
  end
  
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def users
    @users = User.all
    @users_number = @users.count
    
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
  
  def events
    @events = Event.all
    @events_number = @events.count
  
    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end
  
  def finance
  end
  
  def wiki
  end
  
end
