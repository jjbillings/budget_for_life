class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :expense
  validates_numericality_of :amount

  def posting_date
    super.strftime("%m-%d-%Y")
  end
end
