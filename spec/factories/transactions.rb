FactoryBot.define do
  factory :transaction do
    account
    expense

    amount { "420.99" }
    description { "Some random description" }
    vendor { "Ultrarunning fiends" }
  end
end
