# == Schema Information
#
# Table name: savings_goals
#
#  id                 :bigint           not null, primary key
#  current_amount     :decimal(11, 2)
#  name               :string
#  strict_target_date :boolean          default(FALSE)
#  target_amount      :decimal(11, 2)
#  target_date        :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_savings_goals_on_user_id  (user_id)
#

class SavingsGoal < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :target_date
  validates_numericality_of :target_amount, :current_amount

  def proportion_reached
    (current_amount / target_amount).round(4)
  end
end
