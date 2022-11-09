class Admin::PostsController < ApplicationController
  
  def index
    @posts = Post.find(params[:post_id])
  end
  
  def new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
  end
  
  def update
  end
  
  def destroy_all
  end
  
  
end
