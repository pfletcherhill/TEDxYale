class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  helper_method :current_user
  helper_method :current_admin

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_admin
    @current_admin ||= User.find(session[:user_id]) if session[:user_id] && User.find(session[:user_id]).admin == 'a'
  end
 
end
