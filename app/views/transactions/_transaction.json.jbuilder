json.extract! transaction, :id, :amount, :description, :account_id, :expense_id, :vendor, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
