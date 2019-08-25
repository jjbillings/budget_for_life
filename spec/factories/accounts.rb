FactoryBot.define do
  factory :account do |f|
    user

    f.account_type { :brokerage }
    f.name { "Test AcCatamount" }

    trait :with_positions do
      after :create do |account|
        create_list :position, 2, account: account
      end
    end
  end
end
