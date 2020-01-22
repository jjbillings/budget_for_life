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

FactoryBot.define do
  factory :transaction do
    account
    expense

    amount { "420.99" }
    posting_date { Date.new(1990, 01, 12) }
    description { "Some random description" }
    vendor { "Ultrarunning fiends" }
  end
end
