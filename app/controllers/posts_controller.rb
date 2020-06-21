class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.order(id: :desc)
    @posts = Post.page(params[:page]).per(7)
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)
    post.save!
    redirect_to action: :index
  end

  def show
  end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to action: :index
  end

  def destroy
    @post.destroy!
    redirect_to action: :index
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
