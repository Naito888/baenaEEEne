class Admin::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page])
    if params[:keyword].present?
      @posts = Post.search(params[:keyword]).page(params[:page])
    end
  end

  def new
    @post = Post.new
  end

  def create
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def destroy_all
  end


  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
