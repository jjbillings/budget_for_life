require 'rails_helper'

RSpec.describe SavingsGoal, type: :model do
  let(:valid_attributes) { attributes_for(:savings_goal) }
  let(:savings_goal) { SavingsGoal.new(valid_attributes) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(savings_goal).to be_valid
    end

    it "is not valid without a name" do
      savings_goal.name = nil
      expect(savings_goal).not_to be_valid
    end

    it "is not valid without a target_date" do
      savings_goal.target_date = nil
      expect(savings_goal).not_to be_valid
    end

    it "is not valid without a target_amount" do
      savings_goal.target_amount = nil
      expect(savings_goal).not_to be_valid
    end

    it "is not valid without a current_amount" do
      savings_goal.current_amount = nil
      expect(savings_goal).not_to be_valid
    end
  end
end
