require 'rails_helper'

RSpec.describe "savings_goals/show", type: :view do
  before(:each) do
    @savings_goal = assign(:savings_goal, SavingsGoal.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
