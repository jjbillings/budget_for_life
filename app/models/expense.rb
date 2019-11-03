class Expense < ApplicationRecord
  belongs_to :user
  has_many :transactions

  enum status: [:unstarted, :in_progress, :completed]

  def current_amount
    transactions.map(&:amount).sum
  end
end
