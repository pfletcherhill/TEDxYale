class AdminsController < ApplicationController
  
  before_filter :require_login

  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_admin
  end
  
  def new  
    @admin = Admin.new  
  end  
    
  def create  
    @admin = Admin.new(params[:admin])  
    if @admin.save  
      session[:admin_id] = @admin.id   
      redirect_to root_url, :notice => "Welcome!"  
    else  
      render "new"  
    end  
  end 
  
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all(:order => "balance DESC")
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admins }
    end
  end  
  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end
end
