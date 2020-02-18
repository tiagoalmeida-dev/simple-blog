class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @author = Author.new
    @author.build_account
  end

  def edit
  end

  def create
    @author = Author.create(author_params)

    if @author.save
      redirect_to @author, notice: 'author was successfully created.'
    else
      render :new
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author, notice: 'author was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to Authors_url, notice: 'author was successfully destroyed.'
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, account_attributes: [:email, :password, :password_confirmation])
    end
end
