class SavingsGoal < ApplicationRecord
  validates_presence_of :name, :target_date
  validates_numericality_of :target_amount, :current_amount

  def proportion_reached
    (current_amount / target_amount).round(2)
  end
end
