FactoryBot.define do
  factory :account do |f|
    user

    f.account_type { :brokerage }
    f.name { "Test AcCatamount" }
  end
end
