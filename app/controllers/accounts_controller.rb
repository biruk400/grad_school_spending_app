class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]

  def index
    @q = Account.ransack(params[:q])
    @accounts = @q.result(distinct: true).includes(:transactions).page(params[:page]).per(10)
  end

  def show
    @transaction = Transaction.new
  end

  def new
    @account = Account.new
  end

  def edit; end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account, notice: "Account was successfully created."
    else
      render :new
    end
  end

  def update
    if @account.update(account_params)
      redirect_to @account, notice: "Account was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: "Account was successfully destroyed."
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:account_type, :balance)
  end
end
