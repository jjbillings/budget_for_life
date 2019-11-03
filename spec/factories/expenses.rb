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
