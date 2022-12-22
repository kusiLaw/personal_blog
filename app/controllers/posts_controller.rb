class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = 'Deleted successfully'
    else
      flash[:error] = 'Oops something went wrong!, please try again'
    end
    if current_user.role == 'admin'
      redirect_to user_posts_path(@post.author)
    else
      redirect_to user_posts_path(current_user)
    end
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text)
  end
end
