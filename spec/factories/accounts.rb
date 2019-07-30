FactoryBot.define do
  factory :account do
    user
    account_type { 1 }
    name { "Test AcCatamount" }
  end
end
