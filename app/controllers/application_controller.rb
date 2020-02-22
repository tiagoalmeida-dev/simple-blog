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

  def authorized
    redirect_to login_url unless logged_in?
  end
end
