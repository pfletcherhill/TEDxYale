class AnnouncementsController < ApplicationController
  def home
    @announcements = Announcement.limit(4)
    
    @user = User.new
  end
end
