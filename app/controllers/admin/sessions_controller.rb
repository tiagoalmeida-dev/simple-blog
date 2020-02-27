class Admin::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @account = Account.new
  end

  def create
    @account = Account.find_by_email(params[:email])

    if @account && @account.authenticate(params[:password])
      session[:account_id] = @account.id
      redirect_to root_url
    else
      flash.alert = "Unable to log in. Please check your credentials and try again."
      redirect_to login_url
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_url
  end
end
