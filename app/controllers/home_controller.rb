class HomeController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    @posts = Post.all
  end
end
