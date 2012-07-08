class VideosController < ApplicationController
  
  before_filter :require_login, :only => ["edit", "update", "new", "create"]

  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_user
  end
  
  def index
    @videos = Video.all
    
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(params[:video])
    
    respond_to do |format|
      if @video.save
        format.html { redirect_to "/admin/tv", notice: @video.title + 'was added.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { redirect_to "/videos/new", notice: 'Better luck next time' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to "/admin/tv", notice: @video.title + ' was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    
    respond_to do |format|
      format.html { redirect_to "/admin/tv", notice: @video.title + ' was deleted.' }
      format.json { head :no_content }
    end
  end
end
