# == Schema Information
#
# Table name: expenses
#
#  id                 :bigint           not null, primary key
#  amount             :decimal(11, 2)
#  name               :string
#  status             :integer
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
end
