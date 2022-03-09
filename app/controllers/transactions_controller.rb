class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  def index
    @q = Transaction.ransack(params[:q])
    @transactions = @q.result(distinct: true).includes(:user, :category,
                                                       :account).page(params[:page]).per(10)
  end

  def show; end

  def new
    @transaction = Transaction.new
  end

  def edit; end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      message = "Transaction was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @transaction, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: "Transaction was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    message = "Transaction was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to transactions_url, notice: message
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:user_id, :amount, :category_id,
                                        :transaction_date, :account_id, :event)
  end
end
