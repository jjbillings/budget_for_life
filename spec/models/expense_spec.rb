require 'rails_helper'

RSpec.describe Expense, type: :model do
  let!(:expense) { create(:expense) }

  describe "#current_amount" do
    context "with transactions" do
      let!(:transactions) { create_list(:transaction, 2, { expense: expense })}

      it "computes current amount with transactions" do
        # It's really frustrating that this is testing implementation
        expected_amount = transactions.map(&:amount).sum
        expect(expense.current_amount).to eq(expected_amount)
      end
    end

    it "computes current amount without transactions" do
      expected_amount = 0
      expect(expense.current_amount).to eq(expected_amount)
    end
  end
end
