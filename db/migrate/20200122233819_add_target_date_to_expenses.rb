class AddTargetDateToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :target_date, :date, :default => Date.tomorrow
    add_column :expenses, :strict_target_date, :boolean, :default => false
  end
end
