# == Schema Information
#
# Table name: expenses
#
#  id                 :bigint           not null, primary key
#  amount             :decimal(11, 2)
#  name               :string
#  strict_target_date :boolean          default(FALSE)
#  target_date        :date             default(Sun, 08 Mar 2020)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_expenses_on_user_id  (user_id)
#

FactoryBot.define do
  factory :expense do |f|
    user

    f.name { "MyString" }
    f.amount { "9.99" }
    f.target_date { Date.new(2020, 01, 22) }
    f.strict_target_date  { false }

    # TODO: Not using this rn
    trait :with_transactions do
      after :create do |expense|
        create_list :transaction, 2, expense: expense
      end
    end
  end
end
