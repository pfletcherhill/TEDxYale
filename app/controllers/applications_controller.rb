class ApplicationsController < ApplicationController
  
  before_filter :require_login, only: [:show, :admin]
  
  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_admin
  end
  
  def new
    @application_cycle = ApplicationCycle.find_by_slug(params[:slug]) if params[:slug]
    if !@application_cycle.end_date || (@application_cycle.end_date > DateTime.now())
      @application = Application.new
    else
      render :over
    end
  end
  
  def student_speaker_competition
    #@application = Application.new
    @winners = StudentSpeaker.order("-votes_count").first(3)
    @time_left = Time.parse(ENV['COMPETITION_END']) - Time.now
    @cycle = ENV['speaker_application_cycle'].to_i
    @nominate_cycle = ENV['nominate_application_cycle'].to_i
  end
  
  def create
    @application = Application.new(params[:application])
    respond_to do |format|
      if @application.save
        format.html { redirect_to root_url, notice: 'Thank you for applying, #{@application.name}.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render }
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
  
  def admin
    @applications = ApplicationCycle.find(ENV['speaker_application_cycle']).applications
    @nominations = ApplicationCycle.find(ENV['nominate_application_cycle']).applications
  end
  
  def email_nomination
    @app = Application.find(params[:id])
    UserMailer.student_nomination_email(@app).deliver
    @app.emailed = true
    @app.save
    redirect_to admin_competition_path
  end
  
end
