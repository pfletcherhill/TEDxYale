class StudentSpeakersController < ApplicationController
  
  before_filter :require_login, :only => ["new", "create"]
  before_filter :require_user, :only => ["vote"]
    
  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
  
  def require_user
    unless logged_into_user?
      redirect_to '/2013'
    end
  end
  
  def logged_into_user?
    !!current_user
  end
 
  def logged_in?
    !!current_admin
  end
  
  def index
    @speakers = StudentSpeaker.all.shuffle
    render json: @speakers.as_json
  end
  
  def new
    @speaker = StudentSpeaker.new
  end
  
  def create
    @speaker = StudentSpeaker.new(params[:student_speaker])
    
    respond_to do |format|
      if @speaker.save
        format.html { redirect_to "/admin", notice: "Thanks for registering! We've sent you an email with a speaker code." }
        format.json { render json: @speaker, status: :created, location: @speaker }
      else
        format.html { redirect_to "/student_speakers/new" }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end 
  
  def facebook
    token = params[:token]
    fb_id = params[:fb_id]
    @fb_graph = Koala::Facebook::API.new( token )
    fb_user = @fb_graph.get_object( fb_id )
    user = User.where(:email => fb_user['email']).first
    unless user
      user = User.create(:name => fb_user['name'], :email => fb_user['email'])
    end
    session[:user_id] = user.id
    redirect_to "/2013"
  end
  
  def vote
    user = User.find(params[:id])
    if user.has_votes? || user.is_admin?
      video = StudentSpeaker.find(params[:video])
      vote = Vote.new(:user_id => user.id, :student_speaker_id => video.id)
      if vote.save
        render json: vote
      end
    else
      render json: user, status: :unprocessable_entity
    end
  end
end
