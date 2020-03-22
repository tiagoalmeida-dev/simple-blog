class Admin::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:new, :create]

  def new
    @author = Author.new
    @author.build_account
  end

  def show
    @posts = Post.with_author(params[:id])
  end

  def edit
  end

  def create
    @author = Author.create(author_params)

    if @author.save
      session[:account_id] = @author.account.id
      redirect_to admin_author_posts_url(@author)
    else
      render :new
    end
  end

  def update
    if @author.update(author_params)
      redirect_to admin_author_url(@author)
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to new_admin_author_url
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, account_attributes: [:email, :password, :password_confirmation])
  end
end
