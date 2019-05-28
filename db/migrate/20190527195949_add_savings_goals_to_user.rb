class AddSavingsGoalsToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :savings_goals, :user, index: true
  end
end
