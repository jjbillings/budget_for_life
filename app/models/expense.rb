# == Schema Information
#
# Table name: expenses
#
#  id                 :bigint           not null, primary key
#  amount             :decimal(11, 2)
#  name               :string
#  strict_target_date :boolean          default(FALSE)
#  target_date        :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_expenses_on_user_id  (user_id)
#

class Expense < ApplicationRecord
  belongs_to :user
  has_many :transactions

  module Statuses
    UNSTARTED = "unstarted"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    LATE = "late"
  end

  def current_amount
    transactions.map(&:amount).sum
  end

  def status
    return Statuses::LATE if Date.current > target_date && current_amount < amount
    return Statuses::UNSTARTED if current_amount == 0
    return current_amount < amount ? Statuses::IN_PROGRESS : Statuses::COMPLETED
  end
end
