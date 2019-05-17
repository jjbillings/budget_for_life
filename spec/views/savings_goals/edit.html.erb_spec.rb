require 'rails_helper'

RSpec.describe "savings_goals/edit", type: :view do
  before(:each) do
    @savings_goal = assign(:savings_goal, SavingsGoal.create!())
  end

  it "renders the edit savings_goal form" do
    render

    assert_select "form[action=?][method=?]", savings_goal_path(@savings_goal), "post" do
    end
  end
end
