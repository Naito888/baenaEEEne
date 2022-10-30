class Customer::PostsController < ApplicationController

  before_action :authenticate_customer!

  def new
    @post = Post.new
  end

  def index
    @posts = Post.page(params[:page])
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to customer_posts_path(@post.id)
  end

  def confirm
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def post_params
    params.require(:post).permit(:customer_id, :caption, :image)
  end

end

