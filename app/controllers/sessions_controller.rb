class SessionsController < ApplicationController
  def new
  end
  
  def speaker
  end
  
  def create  
    user = User.authenticate(params[:email], params[:password])  
    
    if user  
      session[:user_id] = user.id
      redirect_to "/2013", :notice => "Welcome back #{user.name}"  
    else
      flash[:notice] = 'Invalid Email or Password'
      render "new"
    end  
  end
  
  def speaker_create
    speaker = Speaker.authenticate(params[:email], params[:password])  
    
    if speaker  
      session[:speaker_id] = speaker.id
      redirect_to "/speaker", :notice => "Welcome back #{speaker.name}"  
    else
      flash[:notice] = 'Invalid Email or Speaker Code'
      render action: "speaker"
    end
  end
  
  def destroy  
    session[:user_id] = nil  
    session[:speaker_id] = nil
    redirect_to root_url, :notice => "Logged Out"  
  end 
end