class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    @post = Post.find(params[:post_id])
    render json: @post.comments
  end

  def show
    render json: @comment
  end

  def create
    author = User.find_by_api_token(params[:api_token])
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.author = author
    comment.post = post
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.error, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
