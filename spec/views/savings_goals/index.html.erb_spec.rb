require 'rails_helper'

RSpec.describe "savings_goals/index", type: :view do
  before(:each) do
    assign(:savings_goals, [
      SavingsGoal.create!(),
      SavingsGoal.create!()
    ])
  end

  it "renders a list of savings_goals" do
    render
  end
end
