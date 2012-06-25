class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  helper_method :current_admin

  private

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  
end
