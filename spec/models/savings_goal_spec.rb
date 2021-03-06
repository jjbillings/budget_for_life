# == Schema Information
#
# Table name: savings_goals
#
#  id                 :bigint           not null, primary key
#  current_amount     :decimal(11, 2)
#  name               :string
#  strict_target_date :boolean          default(FALSE)
#  target_amount      :decimal(11, 2)
#  target_date        :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_savings_goals_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe SavingsGoal, type: :model do
  let(:savings_goal) { build(:savings_goal) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(savings_goal).to be_valid
    end

    it "is not valid without a name" do
      savings_goal.name = nil
      expect(savings_goal).not_to be_valid
    end

    it "is not valid without a date target_date" do
      savings_goal.target_date = "fkae"
      expect(savings_goal).not_to be_valid
    end

    it "is not valid without a numerical target_amount" do
      savings_goal.target_amount = "bogus"
      expect(savings_goal).not_to be_valid
    end

    it "is not valid without a numerical current_amount" do
      savings_goal.current_amount = "NaN"
      expect(savings_goal).not_to be_valid
    end
  end

  describe "#proportion_reached" do
    it "returns the correct proportion" do
      savings_goal.current_amount = 50
      savings_goal.target_amount = 500

      expect(savings_goal.proportion_reached).to eq(0.10)
    end

    it "returns the proportion rounded to nearest thousandth" do
      savings_goal.current_amount = 1
      savings_goal.target_amount = 3

      expect(savings_goal.proportion_reached).to eq(0.3333)
    end
  end
end
