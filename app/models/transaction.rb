# == Schema Information
#
# Table name: transactions
#
#  id           :bigint           not null, primary key
#  amount       :decimal(11, 2)
#  description  :string
#  vendor       :string
#  account_id   :bigint           not null
#  expense_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  posting_date :date
#

class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :expense
  validates_numericality_of :amount

  def posting_date
    super.strftime("%m-%d-%Y")
  end
end
