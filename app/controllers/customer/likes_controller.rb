class Customer::LikesController < ApplicationController

  def index

  end

  def create
    @post = Post.find(params[:post_id])
    like = current_customer.likes.new(post_id: @post.id)
    like.save
    redirect_to customer_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_customer.likes.find_by(post_id: @post.id)
    like.destroy
    redirect_to customer_post_path(@post)
  end

end
