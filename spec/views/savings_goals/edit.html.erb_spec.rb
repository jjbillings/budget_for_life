require 'rails_helper'

RSpec.describe "savings_goals/edit", type: :view do
  let(:savings_goal) { SavingsGoal.create(attributes_for(:savings_goal)) }

  it "renders the edit savings_goal form" do
    skip "Need to build out the UI"
    render

    assert_select "form[action=?][method=?]", savings_goal_path(savings_goal), "post" do
    end
  end
end
