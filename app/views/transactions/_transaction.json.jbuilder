json.extract! transaction, :id, :user_id, :amount, :category_id,
              :transaction_date, :account_id, :event, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
