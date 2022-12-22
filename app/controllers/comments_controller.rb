class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = post
    if @comment.save
      flash[:success] = 'Comment Added successfully!'
      redirect_to user_post_path(current_user, post)
    else
      flash[:error] = 'Something went wrong! Comment not added!'
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:notice] = 'Comment was deleted successfully'
      redirect_to user_post_path(current_user, post)
    else
      flash[:error] = 'Something went wrong! Comment was not deleted'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
