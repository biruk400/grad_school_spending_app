class Api::V1::AccountsController < Api::V1::GraphitiController
  def index
    accounts = AccountResource.all(params)
    respond_with(accounts)
  end

  def show
    account = AccountResource.find(params)
    respond_with(account)
  end

  def create
    account = AccountResource.build(params)

    if account.save
      render jsonapi: account, status: 201
    else
      render jsonapi_errors: account
    end
  end

  def update
    account = AccountResource.find(params)

    if account.update_attributes
      render jsonapi: account
    else
      render jsonapi_errors: account
    end
  end

  def destroy
    account = AccountResource.find(params)

    if account.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: account
    end
  end
end
