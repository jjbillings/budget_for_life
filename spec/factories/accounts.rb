# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  account_type :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#

FactoryBot.define do
  factory :account do |f|
    user

    f.account_type { :brokerage }
    f.name { "Test AcCatamount" }
  end
end
