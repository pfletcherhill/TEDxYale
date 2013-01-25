class SpeakersController < ApplicationController
  
  before_filter :require_login, :except => ["new_student", "create", "admin", "personal", "questionnaire", "talk_information", "account", "release_form", "announcement", "update"]
  before_filter :require_speaker, :only => ["admin", "update", "personal", "questionnaire", "talk_information", "account", "release_form", "announcement"]
  
  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
  
  def require_speaker
    unless logged_in_speaker?
      redirect_to '/speaker_login'
    end
  end
 
  def logged_in?
    !!current_admin
  end
  
  def logged_in_speaker?
    !!current_speaker
  end
  
  def index
    @speakers = Speaker.all
  end
  
  def edit
    @speaker = current_speaker
  end
  
  def update
    @speaker = Speaker.find(params[:id])
    if params[:speaker][:password] && params[:speaker][:password_confirmation] && !params[:speaker][:password].empty? && !params[:speaker][:password_confirmation].empty?
      if Speaker.authenticate(params[:speaker][:email], params[:speaker][:password_confirmation])
        @speaker.password = params[:speaker][:password]
        @speaker.generate_password
      else
        redirect_to "/speaker/personal", notice: 'Invalid Password'
        return
      end
    end
    respond_to do |format|
      if @speaker.update_attributes(params[:speaker])
        format.html { redirect_to "/speaker", notice: 'Your profile was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "personal" }
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
        format.html { redirect_to "/admin/speakers" }
        format.json { render json: @speaker, status: :created, location: @speaker }
        #UserMailer.speaker_email(@speaker, @speaker.password).deliver
      else
        format.html { redirect_to "/become_a_speaker" }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @speaker = Speaker.find(params[:id])
    respond_to do |format|
      if @speaker.destroy
        format.html { redirect_to "/admin/speakers" }
      else
        format.html { redirect_to "/admin/speakers/#{@speaker.id}" }
      end
    end
  end
  
  def new_student
    @speaker = Speaker.new
  end
  
  # Speaker Panel
  def admin
    @speaker = current_speaker
  end
  
  def personal
    @speaker = current_speaker
  end
  
  def questionnaire
    @speaker = current_speaker
  end
  
  def talk_information
    @speaker = current_speaker
  end
  
  def release_form
    @speaker = current_speaker
  end
  
  def announcement
    @speaker = current_speaker
  end
  
end
