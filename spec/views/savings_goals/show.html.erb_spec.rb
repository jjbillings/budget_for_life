require 'rails_helper'

RSpec.describe "savings_goals/show", type: :view do
    let(:savings_goal) { create(attributes_for(:savings_goal)) }

  it "renders attributes in <p>" do
    render
  end
end
