class UsersController < ApplicationController
  
  before_filter :require_login, :only => ["index", "show", "edit", "update"]

  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_admin
  end
    
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @comm_users = User.where(:team => "community_pr")
    @comm_number = @comm_users.count 
    @design_users = User.where(:team => "design")
    @design_number = @design_users.count
    @events_users = User.where(:team => "events")
    @events_number = @events_users.count
    @finance_users = User.where(:team => "finance")
    @finance_number = @finance_users.count
    @prod_users = User.where(:team => "production")
    @production_number = @prod_users.count
    @attendees = User.where(:team => "event_saman")
    @attendees_number = @attendees.count
    
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

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if (@user.save && @user.team == "event_saman")
      	# Tell the UserMailer to send a confirmation Email after save
        #UserMailer.welcome_email(@user).deliver
        
      	format.html { redirect_to "/", notice: 'Thank you for registering. Feel free to share the event with your friends' }
      elsif (@user.save && @user.team != "event_saman")
        format.html { redirect_to "/join", notice: 'Thank you for applying. We will contact you shortly with more information. Feel free to apply to another team as well.' }
      else
        format.html { render action: @user.team }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

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
  
  def community_pr
    @user = User.new
  	
  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
   def design
    @user = User.new
  	
  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
   def events
    @user = User.new
  	
  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
   def finance
    @user = User.new
  	
  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
   def production
    @user = User.new
  	
  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
  def event_saman
    @user = User.new
    
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
end
