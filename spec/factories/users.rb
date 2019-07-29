FactoryBot.define do
  factory :user do
    first_name { "Stan" }
    last_name { "The-Man" }
    email { "#{first_name}_#{last_name}_#{SecureRandom.hex(5)}@tester.com" }
    birthdate { 20.years.ago }
    password { SecureRandom.hex(10) }
  end
end
