# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  name       :string
#  amount     :decimal(11, 2)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryBot.define do
  factory :expense do |f|
    user

    f.name { "MyString" }
    f.amount { "9.99" }
    f.status { :unstarted }

    # TODO: Not using this rn
    trait :with_transactions do
      after :create do |expense|
        create_list :transaction, 2, expense: expense
      end
    end
  end
end
