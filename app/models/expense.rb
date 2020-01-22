# == Schema Information
#
# Table name: expenses
#
#  id                 :bigint           not null, primary key
#  amount             :decimal(11, 2)
#  name               :string
#  status             :integer
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

  enum status: [:unstarted, :in_progress, :completed]

  def current_amount
    transactions.map(&:amount).sum
  end
end
