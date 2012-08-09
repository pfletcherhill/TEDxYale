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
    @users = User.order('name ASC')
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
  
  def speakers
    @speakers = Speaker.all
  end
  
  def tv
    @videos = Video.order('title ASC')
  end
  def wiki
  end
  
end
