class EventsController < ApplicationController
  
  before_filter :require_login, :only => "new, create"
  
  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_admin
  end
  
  def index
    @events = Event.where({ :published => true }).order("datetime DESC")
    @carousals = @events.limit(3).reverse
    @salons = @events.where({ :type => '1' })
    @conferences = @events.where({ :type => '2' })
    @past_events = @events.all(:conditions => ['datetime < ?', DateTime.now])
    @future_events = @events.all(:conditions => ['datetime > ?', DateTime.now])
  end
  
  def show
    @event = Event.find(params[:id])
    @sponsorships = @event.sponsorships
    if current_user
      @attendee = Attendee.where({ :event_id => @event.id, :user_id => current_user.id })
    end
    @speakers = @event.speakers
  end
  
  def new
    @event = Event.new
    logger.debug "New View"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end
  
  def create
    @event = Event.new(params[:event])
    logger.debug "The object is creating"
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    @users = @event.users
    @users_count = @users.count
    @speakers = @event.speakers
    @speaker = Speaker.new
    
    @checked_in = Attendee.where({ :event_id => @event.id, :checked_in => true })
    @checked_in_users = @checked_in.map { |attendee| attendee.user }
    @checked_in_count = @checked_in_users.count
    
    respond_to do |format|
      format.html
      format.json { render json: @checked_in_users }
    end
  end
  
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to "/admin/events", notice: @event.name + ' was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def registration
    @event = Event.find(params[:id])
    @checked_out = Attendee.where({ :event_id => @event.id, :checked_in => false })
    @checked_out_users = @checked_out.map { |attendee| attendee.user }
    
    respond_to do |format|
      format.html
      format.json { render json: @checked_out_users }
    end
  end 
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    respond_to do |format|
      format.html { redirect_to "/admin/events", notice: @event.name + ' was deleted.' }
      format.json { head :no_content }
    end
  end
  
  def publish
    @event = Event.find(params[:id])
    @event.update_attributes(:published => true)
    respond_to do |format|
      format.html { redirect_to "/events/#{@event.id}", notice: @event.name + ' was published' }
      format.json { head :no_content }
    end
  end
  
  def unpublish
    @event = Event.find(params[:id])
    @event.update_attributes(:published => false)
    respond_to do |format|
      format.html { redirect_to "/events/#{@event.id}", notice: @event.name + ' was unpublished' }
      format.json { head :no_content }
    end
  end
  
  def conference
    @speakers = StudentSpeaker.all
  end
end
