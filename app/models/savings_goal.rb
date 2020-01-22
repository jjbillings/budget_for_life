# == Schema Information
#
# Table name: savings_goals
#
#  id                 :bigint           not null, primary key
#  name               :string
#  target_date        :date
#  strict_target_date :boolean          default(FALSE)
#  target_amount      :decimal(11, 2)
#  current_amount     :decimal(11, 2)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#

class SavingsGoal < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :target_date
  validates_numericality_of :target_amount, :current_amount

  def proportion_reached
    (current_amount / target_amount).round(4)
  end
end
