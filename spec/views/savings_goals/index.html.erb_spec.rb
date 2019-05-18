require 'rails_helper'

RSpec.describe "savings_goals/index", type: :view do
  let(:savings_goals) { create_list(:savings_goal, 2) }

  it "renders a list of savings_goals" do
    render
  end
end
