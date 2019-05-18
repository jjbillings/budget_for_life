class SavingsGoal < ApplicationRecord
  validates_presence_of :name, :target_date
  validates_numericality_of :target_amount, :current_amount
end
