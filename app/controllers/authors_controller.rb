class AuthorsController < ApplicationController
  skip_before_action :authorized, only: [:show]

  def show
    @author = Author.find(params[:id])
    @posts = Post.with_author(params[:id])
  end
end
