require 'rails_helper'

RSpec.describe "savings_goals/show", type: :view do
  let(:savings_goal) { create(:savings_goal) }
  before(:each) { assign(:savings_goal, savings_goal) }

  it "renders all savings_goal attributes" do
    render
    expect(rendered).to include savings_goal.name
    expect(rendered).to include savings_goal.target_date.to_s
    expect(rendered).to include number_with_delimiter(savings_goal.target_amount).to_s
    expect(rendered).to include number_with_delimiter(savings_goal.current_amount).to_s
  end

  it "renders proportion of goal reached as a percent" do
    savings_goal.current_amount = 1
    savings_goal.target_amount = 3
    percentage = 33.33
    
    render
    expect(rendered).to include percentage.to_s
  end
end
