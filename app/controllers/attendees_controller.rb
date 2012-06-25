class AttendeesController < ApplicationController
  def check_in
    @attendee = Attendee.where({'user_id' => params[:user_id], 'event_id' => params[:event_id]}).first
    @attendee.update_attributes(:checked_in => true)
    @event = @attendee.event_id
    respond_to do |format|
      format.html { redirect_to "/events/#{@event}/registration" }
      format.json { head :no_content }
    end
  end
  
  def check_out
    @event_id = params[:event_id]
    @attendee = Attendee.where({'user_id' => params[:user_id], 'event_id' => params[:event_id]}).first
    @attendee.update_attributes(:checked_in => false)
    @event = @attendee.event_id
    respond_to do |format|
      format.html { redirect_to "/events/#{@event}/registration" }
      format.json { head :no_content }
    end
  end
  
  def register
    @event_id = params[:event_id]
    @attendee = Attendee.new({ 'user_id' => params[:user_id], 'event_id' => params[:event_id], 'checked_in' => false })
    
    if @attendee.save
      respond_to do |format|
        format.html { redirect_to "/events/#{@event_id}", :notice => "Thanks for registering" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/events/#{@event_id}", :notice => "You have already registered for this event" }
        format.json { head :no_content }
      end
    end
  end
  
  def unregister
    @event_id = params[:event_id]
    @attendee = Attendee.where({ 'user_id' => params[:user_id], 'event_id' => params[:event_id] }).first
    @attendee.destroy
    
    if @attendee.destroy
      respond_to do |format|
        format.html { redirect_to "/events/#{@event_id}", :notice => "You're no longer registered for this event" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/events/#{@event_id}", :notice => "Please try again" }
        format.json { head :no_content }
      end
    end
  end
  
  def add_attended
    @attendee = Attendee.new({ 'user_id' => params[:user_id], 'event_id' => params[:event_id], 'checked_in' => true })
  end
  
  def create
    @attendee = Attendee.new(params[:attendee])
    respond_to do |format|
      if @attendee.save
        format.html { redirect_to "/dashboard/attended_events", notice: 'Added event.' }
        format.json { render json: @attendee, status: :created, location: @attendee }
      else
        format.html { redirect_to "/dashboard/attended_events", notice: 'That event is already in your list' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end
end
