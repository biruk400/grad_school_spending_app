class UpcomingTransactionsController < ApplicationController
  before_action :set_upcoming_transaction, only: [:show, :edit, :update, :destroy]

  # GET /upcoming_transactions
  def index
    @upcoming_transactions = UpcomingTransaction.all
  end

  # GET /upcoming_transactions/1
  def show
  end

  # GET /upcoming_transactions/new
  def new
    @upcoming_transaction = UpcomingTransaction.new
  end

  # GET /upcoming_transactions/1/edit
  def edit
  end

  # POST /upcoming_transactions
  def create
    @upcoming_transaction = UpcomingTransaction.new(upcoming_transaction_params)

    if @upcoming_transaction.save
      redirect_to @upcoming_transaction, notice: 'Upcoming transaction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /upcoming_transactions/1
  def update
    if @upcoming_transaction.update(upcoming_transaction_params)
      redirect_to @upcoming_transaction, notice: 'Upcoming transaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /upcoming_transactions/1
  def destroy
    @upcoming_transaction.destroy
    message = "UpcomingTransaction was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to upcoming_transactions_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upcoming_transaction
      @upcoming_transaction = UpcomingTransaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def upcoming_transaction_params
      params.require(:upcoming_transaction).permit(:user_id, :name)
    end
end
