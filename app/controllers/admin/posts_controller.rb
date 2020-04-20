class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.with_author(current_author.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_author.posts.create(post_params)

    if @post.save
      redirect_to admin_author_posts_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to admin_author_posts_url current_author
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_author_posts_url current_author
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
