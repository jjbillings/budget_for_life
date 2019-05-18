require 'rails_helper'

RSpec.describe "savings_goals/new", type: :view do
  before(:each) do
    assign(:savings_goal, SavingsGoal.new())
  end

  it "renders new savings_goal form" do
    render

    assert_select "form[action=?][method=?]", savings_goals_path, "post" do
    end
  end
end
