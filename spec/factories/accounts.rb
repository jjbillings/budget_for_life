# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  user_id      :integer
#  account_type :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :account do |f|
    user

    f.account_type { :brokerage }
    f.name { "Test AcCatamount" }
  end
end
