require 'rails_helper'

RSpec.describe "positions/new", type: :view do
  let(:position) { create(:position, { quantity: 2 }) }
  before(:each) { assign(:position, position) }

  it "renders new position form" do
    skip "Need to build out UI"
    render

    assert_select "form[action=?][method=?]", positions_path, "post" do

      assert_select "input[name=?]", "position[quantity]"

      assert_select "input[name=?]", "position[price]"

      assert_select "input[name=?]", "position[ticker]"
    end
  end
end
