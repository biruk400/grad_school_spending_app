class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show edit update destroy]

  def index
    @q = Budget.ransack(params[:q])
    @budgets = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @budget = Budget.new
  end

  def edit; end

  def create
    @budget = Budget.new(budget_params)

    if @budget.save
      message = "Budget was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @budget, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @budget.update(budget_params)
      redirect_to @budget, notice: "Budget was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @budget.destroy
    message = "Budget was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to budgets_url, notice: message
    end
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:user_id, :category_id, :amount)
  end
end
