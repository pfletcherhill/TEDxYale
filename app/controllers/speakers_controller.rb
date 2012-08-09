class SpeakersController < ApplicationController
  
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
    @speakers = Speaker.all
  end
  
  def edit
    @speaker = Speaker.find(params[:id])
  end
  
  def update
    @speaker = Speaker.find(params[:id])

    respond_to do |format|
      if @speaker.update_attributes(params[:speaker])
        format.html { redirect_to "/admin/speakers", notice: @speaker.name + ' was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def new
    @speaker = Speaker.all
    @speaker = Speaker.new
    @events = Event.order('datetime DESC')
  end
  
  def create
    @speaker = Speaker.new(params[:speaker])
    
    respond_to do |format|
      if @speaker.save
        format.html { redirect_to "/admin/speakers", notice: 'Added speaker.' }
        format.json { render json: @speaker, status: :created, location: @speaker }
      else
        format.html { redirect_to "/speaker/new", notice: 'Better luck next time' }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end
end
