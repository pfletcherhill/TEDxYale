class AdminController < ApplicationController
  
  respond_to :html, :json
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
  
  def lists
    @lists = List.all
    @user_count = User.count
  end
  
  def show_list
    @list = List.find(params[:id])
  end
  
  def events
    @events = Event.all
    @events_number = @events.count
  
    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end
  
  def applications
    @application_cycles = ApplicationCycle.all
    #@applications = Application.all
    #@applications_number = @applications.count
    respond_with @application_cycles
  end
  
  def finance
  end
  
  def speakers
    @events = Event.all
    @speakers = Speaker.all
  end
  
  def student_speakers
    @speakers = StudentSpeaker.all
  end
  
  def show_speaker
    @speaker = Speaker.find(params[:id])
  end
  
  def tv
    @videos = Video.order('title ASC')
  end
  
  def votes
    @users = User.all
    @student_speakers = StudentSpeaker.all
  end
  
  def wiki
  end
  
  def sponsors
    @sponsors = Sponsor.all
    @sponsorships = Sponsorship.all
  end
  
  def edit_speaker
    @speaker = Speaker.find(params[:id])
  end
  
end
