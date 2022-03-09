json.extract! budget, :id, :user_id, :category_id, :amount, :created_at, :updated_at
json.url budget_url(budget, format: :json)
