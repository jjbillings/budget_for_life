class AddExpensesToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :expenses, :user, index: true
  end
end
