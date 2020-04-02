class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @account = Account.new
  end

  def create
    @account = Account.find_by_email(params[:email])

    if @account && @account.authenticate(params[:password])
      session[:account_id] = @account.id
      redirect_to admin_author_posts_url(@account.author)
    else
      flash.alert = "Unable to log in. Please check your credentials and try again."
      redirect_to login_url
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to login_url
  end
end
