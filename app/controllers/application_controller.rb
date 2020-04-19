class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_account
  helper_method :current_author
  helper_method :logged_in?

  def current_account
    if session[:account_id]
      @current_account ||= Account.find(session[:account_id])
    else
      @current_account = nil
    end
  end

  def current_author
    unless current_account.nil?
      @current_author = current_account.author
    else
      @current_author = nil
    end
  end

  def logged_in?
    !current_account.nil?
  end

  def authorized?
    author_id = params[:author_id]
    author_id ||= params[:id]
    current_author.id == author_id.to_i
  end

  def authorized
    redirect_to "/403" unless authorized?
    redirect_to login_url unless logged_in?
  end
end
