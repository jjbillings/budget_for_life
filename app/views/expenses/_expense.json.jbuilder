json.extract! expense, :id, :name, :amount, :status, :created_at, :updated_at
json.url expense_url(expense, format: :json)
