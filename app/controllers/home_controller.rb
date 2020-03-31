class HomeController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    @posts = Post.order(updated_at: :desc)
  end
end
