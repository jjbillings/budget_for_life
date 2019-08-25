FactoryBot.define do
  factory :position do |f|
    account
    savings_goal

    quantity { 1 }
    price { "9.99" }
    ticker { "Ticker" }
  end
end
