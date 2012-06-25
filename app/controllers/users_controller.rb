class UsersController < ApplicationController
  
  before_filter :require_login, :only => ["index", "show", "edit", "update", "registration"]

  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_user
  end
  
  def checked_in?
    @attendee = Attendee.where({ :event_id => params[:event_id], :user_id => user.id })
    if @attendee.checked_in == true
      true
    else
      false
    end
  end
  
  def new  
    @user = User.new  
  end  
    
  def create  
    @user = User.new(params[:user])  
    if @user.save  
      UserMailer.welcome_email(@user).deliver
      
      session[:user_id] = @user.id   
      redirect_to root_url, :notice => "Welcome #{@user.name}!"  
    else  
      render "new"  
    end  
  end 
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def subscribe
    @user = User.new
    
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
  
  def dashboard
    @user = current_user
    @events = @user.events
    @past_events = @events.all(:conditions => ['datetime < ?', DateTime.now])
    @future_events = @events.all(:conditions => ['datetime > ?', DateTime.now])
  end
  
  def current_events
    @user = current_user
    @events = @user.events
    @future_events = @events.all(:conditions => ['datetime > ?', DateTime.now])
  end
  
  def attended_events
    @user = current_user
    @events = @user.events
    @past_events = @events.all(:conditions => ['datetime < ?', DateTime.now])
    @published_events = Event.where(:published => true)
    @attendee = Attendee.new
  end
  
  def edit
    @user = current_user
    @events = @user.events
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to "/dashboard/preferences", notice: @user.name + ' was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end  
    
end