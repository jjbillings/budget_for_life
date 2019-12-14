FactoryBot.define do
  factory :transaction do
    account
    expense

    amount { "420.99" }
    posting_date { Date.new(1990, 01, 12) }
    description { "Some random description" }
    vendor { "Ultrarunning fiends" }
  end
end
