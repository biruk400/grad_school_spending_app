Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "transactions#index"
  resources :budgets
  resources :upcoming_transactions
  resources :accounts
  resources :categories
  resources :users
  resources :transactions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
