class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  # GET /budgets
  def index
    @budgets = Budget.all
  end

  # GET /budgets/1
  def show
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  def create
    @budget = Budget.new(budget_params)

    if @budget.save
      redirect_to @budget, notice: 'Budget was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budgets/1
  def update
    if @budget.update(budget_params)
      redirect_to @budget, notice: 'Budget was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budgets/1
  def destroy
    @budget.destroy
    redirect_to budgets_url, notice: 'Budget was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def budget_params
      params.require(:budget).permit(:user_id, :category_id, :amount)
    end
end
