FactoryBot.define do
  factory :user do
    first_name { "Stan" }
    last_name { "The-Man" }
    email { "#{first_name}_#{last_name}@tester.com" }
    birthdate { 20.years.ago }
  end
end
