require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { build(:account) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(account).to be_valid
    end

    it "is not valid wihout an account_type" do
      account.account_type = nil
      expect(account).not_to be_valid
    end

    it "is not valid wihout a name" do
      account.name = nil
      expect(account).not_to be_valid
    end
  end

  describe "#balance" do
    describe "when there are positions on the account" do
      let(:account) { create(:account, :with_positions) }

      it "sums position values" do
        expect(account.balance).to eq(39.96)
      end
    end

    describe "when there are no positions on the account" do
      it "returns 0" do
        expect(account.balance).to eq(0)
      end
    end
  end
end
