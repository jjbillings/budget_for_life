# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  birthdate              :datetime
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#

FactoryBot.define do
  factory :user do
    first_name { "Stan" }
    last_name { "The-Man" }
    email { "#{first_name}_#{last_name}_#{SecureRandom.hex(5)}@tester.com" }
    birthdate { 20.years.ago }
    password { SecureRandom.hex(10) }
  end
end
