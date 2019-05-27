require 'rails_helper'

RSpec.describe "savings_goals/index", type: :view do
  let(:savings_goals) { create_list(:savings_goal, 2) }
  before(:each) { assign(:savings_goals, savings_goals) }

  it "renders a list of savings_goals" do
    render

    # Expect the list to render in a table
    savings_goals.each do |goal|
      keys = attributes_for(:savings_goal).keys
      keys.each { |key| expect(rendered).to include goal[key].to_s }
    end
  end
end
