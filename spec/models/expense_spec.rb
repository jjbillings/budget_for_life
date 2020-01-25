# == Schema Information
#
# Table name: expenses
#
#  id                 :bigint           not null, primary key
#  amount             :decimal(11, 2)
#  name               :string
#  strict_target_date :boolean          default(FALSE)
#  target_date        :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_expenses_on_user_id  (user_id)
#

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

  describe "#status" do
    let(:current_date) { Date.new(2020, 01, 15) }
    before do
      allow(Date).to receive(:current).and_return(current_date)
      expense.amount = 100
    end

    context "when the due date is in the future" do
      let(:future_date) { Date.new(2020, 01, 24) }
      before do
        expense.target_date = future_date
      end

      context "and the expense hasn't been started" do
        before do
          allow(expense).to receive(:current_amount).and_return(0)
        end

        it "returns the correct status" do
          expect(expense.status).to eq(Expense::Statuses::UNSTARTED)
        end
      end

      context "and the expense is not completed" do
        before do
          allow(expense).to receive(:current_amount).and_return(10)
        end

        it "returns the correct status" do
          expect(expense.status).to eq(Expense::Statuses::IN_PROGRESS)
        end
      end

      context "and the expense is paid in full" do
        before do
          allow(expense).to receive(:current_amount).and_return(100)
        end

        it "returns the correct status" do
          expect(expense.status).to eq(Expense::Statuses::COMPLETED)
        end
      end
    end

    context "when the due date is in the past" do
      let(:past_date) { Date.new(2020, 01, 01) }
      before do
        expense.target_date = past_date
      end

      context "and the expense hasn't been started" do
        before do
          allow(expense).to receive(:current_amount).and_return(0)
        end

        it "returns the correct status" do
          expect(expense.status).to eq(Expense::Statuses::LATE)
        end
      end

      context "and the expense hasn't been completed" do
        before do
          allow(expense).to receive(:current_amount).and_return(10)
        end

        it "returns the correct status" do
          expect(expense.status).to eq(Expense::Statuses::LATE)
        end
      end

      context "and the expense is paid in full" do
        before do
          allow(expense).to receive(:current_amount).and_return(100)
        end

        it "returns the correct status" do
          expect(expense.status).to eq(Expense::Statuses::COMPLETED)
        end
      end
    end
  end
end
