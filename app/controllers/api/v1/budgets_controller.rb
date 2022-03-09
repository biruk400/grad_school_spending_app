class Api::V1::BudgetsController < Api::V1::GraphitiController
  def index
    budgets = BudgetResource.all(params)
    respond_with(budgets)
  end

  def show
    budget = BudgetResource.find(params)
    respond_with(budget)
  end

  def create
    budget = BudgetResource.build(params)

    if budget.save
      render jsonapi: budget, status: :created
    else
      render jsonapi_errors: budget
    end
  end

  def update
    budget = BudgetResource.find(params)

    if budget.update_attributes
      render jsonapi: budget
    else
      render jsonapi_errors: budget
    end
  end

  def destroy
    budget = BudgetResource.find(params)

    if budget.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: budget
    end
  end
end
