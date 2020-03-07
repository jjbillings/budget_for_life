json.extract! expense, :id, :name, :amount, :status, :target_date, :created_at, :updated_at
json.url expense_url(expense, format: :json)
