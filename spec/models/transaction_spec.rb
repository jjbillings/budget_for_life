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

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
