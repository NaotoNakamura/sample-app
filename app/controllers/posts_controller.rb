class PostsController < ApplicationController
  before_action :not_logged_in_user
  def new
    @post = Post.new
  end

  def index
    @posts = Post.eager_load(:user).page(params[:page]).per(10)
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post.nil? || post.user_id != current_user.id
      redirect_to root_path
    end
    post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end
end
