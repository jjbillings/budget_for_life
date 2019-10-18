FactoryBot.define do
  factory :transaction do
    account
    expense

    amount { "9.99" }
    description { "MyString" }
    vendor { "MyString" }
  end
end
