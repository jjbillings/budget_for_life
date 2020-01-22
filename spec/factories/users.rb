# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birthdate              :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
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
