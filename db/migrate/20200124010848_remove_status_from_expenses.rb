class RemoveStatusFromExpenses < ActiveRecord::Migration[6.0]
  def change
    remove_column :expenses, :status, :integer
  end
end
