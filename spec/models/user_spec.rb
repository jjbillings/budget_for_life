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

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without a birthdate" do
      user.birthdate = nil
      expect(user).not_to be_valid
    end

    it "is not valid without a email" do
      user.email = nil
      expect(user).not_to be_valid
    end
  end
end
