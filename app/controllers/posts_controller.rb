class PostsController < ApplicationController
  def index
    @wikis = Post.order('title ASC')
  end
  
  def edit
    @wikis = Post.all
    @wiki = Post.find(params[:id])
  end
  
  def update
    @wiki = Post.find(params[:id])

    respond_to do |format|
      if @wiki.update_attributes(params[:post])
        format.html { redirect_to "/wiki", notice: @wiki.title + ' was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def new
    @wikis = Post.all
    @wiki = Post.new
  end
  
  def show
  end
  
  def create
    @wikis = Post.all
    @wiki = Post.new(params[:post])
    
    respond_to do |format|
      if @wiki.save
        format.html { redirect_to "/wiki", notice: 'Added wiki.' }
        format.json { render json: @wiki, status: :created, location: @wiki }
      else
        format.html { redirect_to "/wiki/new", notice: 'Better luck next time' }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @wiki = Post.find(params[:id])
    @wiki.destroy
    
    respond_to do |format|
      format.html { redirect_to "/wiki", notice: @wiki.title + ' was deleted.' }
      format.json { head :no_content }
    end
  end
end
