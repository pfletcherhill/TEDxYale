class SessionsController < ApplicationController
  def new
  end
  
  def create  
    admin = Admin.authenticate(params[:email], params[:password])  
    if admin  
      session[:admin_id] = admin.id  
      redirect_to "/users", :notice => "Welcome back #{admin.name}"  
    else
      flash[:notice] = 'Invalid Email or Password'
      render "new"
    end  
  end
  
  def destroy  
    session[:admin_id] = nil  
    redirect_to root_url, :notice => "Logged Out"  
  end 
end
