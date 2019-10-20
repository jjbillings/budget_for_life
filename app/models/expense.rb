class Expense < ApplicationRecord
  belongs_to :user
  has_many :transactions

  enum status: [:unstarted, :in_progress, :completed]
end
