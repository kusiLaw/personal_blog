class Api::V1::PostsController < Api::V1::ApplicationController
  before_action :set_user, only: %i[index show]
  before_action :set_post, only: [:show]

  def index
    render json: @user.posts
  end

  def show
    render json: @post
  end

  def create
    @user = User.find(params[:user_id])
    post = @user.posts.new(post_params)

    if post.save
      render json: post, status: :created
    else
      render json: post.error, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:post_id])

    if post.destroy
      render json: post, status: :ok
    else
      render json: post.error, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = set_user.posts.find(params[:id])
  end

  # def post_params
  #   params.require(:post).permit(:title, :text)
  # end

  def post_params
    params.require(:posts).permit(:title, :text)
  end
end
