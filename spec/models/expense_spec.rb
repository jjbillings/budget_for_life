require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:expense) { create(:expense, :with_transactions) }

  describe "#current_amount" do
    let(:transaction_amount) { 100.01 }
    before(:each) do
      # This seems way hacky
      expense.transactions.each do |tran|
        tran.amount = transaction_amount
        tran.save!
      end
    end

    it "computes the current amount correctly" do
      expected_amount = transaction_amount * expense.transactions.count
      expect(expense.current_amount).to eq(expected_amount)
    end
  end
end
