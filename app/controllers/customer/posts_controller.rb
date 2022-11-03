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
    @post.customer_id = current_customer.id
    @post.save
    redirect_to customer_post_path(@post)
  end

  def confirm
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to cu_post_path(@post.id)
  end

  def destroy
  end

  def destroy_all
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end

