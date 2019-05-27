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
