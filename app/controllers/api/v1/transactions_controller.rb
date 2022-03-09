class Api::V1::TransactionsController < Api::V1::GraphitiController
  def index
    transactions = TransactionResource.all(params)
    respond_with(transactions)
  end

  def show
    transaction = TransactionResource.find(params)
    respond_with(transaction)
  end

  def create
    transaction = TransactionResource.build(params)

    if transaction.save
      render jsonapi: transaction, status: 201
    else
      render jsonapi_errors: transaction
    end
  end

  def update
    transaction = TransactionResource.find(params)

    if transaction.update_attributes
      render jsonapi: transaction
    else
      render jsonapi_errors: transaction
    end
  end

  def destroy
    transaction = TransactionResource.find(params)

    if transaction.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: transaction
    end
  end
end
