class Customer::CommentsController < ApplicationController

  def index
  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    comment = current_customer.comments.new(comment_params)
    comment.post_id = @post.id
    comment.save
    redirect_to customer_post_path(@post)
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
