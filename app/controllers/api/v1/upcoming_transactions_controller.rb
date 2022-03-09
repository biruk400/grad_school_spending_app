class Api::V1::UpcomingTransactionsController < Api::V1::GraphitiController
  def index
    upcoming_transactions = UpcomingTransactionResource.all(params)
    respond_with(upcoming_transactions)
  end

  def show
    upcoming_transaction = UpcomingTransactionResource.find(params)
    respond_with(upcoming_transaction)
  end

  def create
    upcoming_transaction = UpcomingTransactionResource.build(params)

    if upcoming_transaction.save
      render jsonapi: upcoming_transaction, status: :created
    else
      render jsonapi_errors: upcoming_transaction
    end
  end

  def update
    upcoming_transaction = UpcomingTransactionResource.find(params)

    if upcoming_transaction.update_attributes
      render jsonapi: upcoming_transaction
    else
      render jsonapi_errors: upcoming_transaction
    end
  end

  def destroy
    upcoming_transaction = UpcomingTransactionResource.find(params)

    if upcoming_transaction.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: upcoming_transaction
    end
  end
end
