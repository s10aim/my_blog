class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  PER_PAGE = 7

  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(PER_PAGE).all.with_rich_text_content_and_embeds
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
    @page = Post.order(id: :desc).ids.index(@post.id) / PER_PAGE + 1
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
