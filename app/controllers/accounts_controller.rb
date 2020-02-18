class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @author = Author.create(author_params)
    @account = @author.build_account(account_params)

    if @author.save and @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  def update
    if @account.author.update(author_params) and @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name)
    end

    def account_params
      params.require(:account).permit(:email, :password, :password_confirmation)
    end
end
