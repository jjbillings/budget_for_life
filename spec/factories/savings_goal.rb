FactoryBot.define do
  factory :savings_goal do |f|
    f.name { "asdf" }
    f.target_date { Date.new(2019, 10, 21) }
    f.strict_target_date { false }
    f.target_amount { 12345 }
    f.current_amount { 420.12 }
  end
end
