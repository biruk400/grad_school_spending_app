json.extract! upcoming_transaction, :id, :user_id, :name, :created_at,
              :updated_at
json.url upcoming_transaction_url(upcoming_transaction, format: :json)
