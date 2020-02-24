class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.author = current_author

    if @post.save
      redirect_to author_posts_url
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
