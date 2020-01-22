# == Schema Information
#
# Table name: transactions
#
#  id           :bigint           not null, primary key
#  amount       :decimal(11, 2)
#  description  :string
#  posting_date :date
#  vendor       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :bigint           not null
#  expense_id   :bigint           not null
#
# Indexes
#
#  index_transactions_on_account_id  (account_id)
#  index_transactions_on_expense_id  (expense_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (expense_id => expenses.id)
#

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
