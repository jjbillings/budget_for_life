# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  name       :string
#  amount     :decimal(11, 2)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Expense < ApplicationRecord
  belongs_to :user
  has_many :transactions

  enum status: [:unstarted, :in_progress, :completed]

  def current_amount
    transactions.map(&:amount).sum
  end
end
