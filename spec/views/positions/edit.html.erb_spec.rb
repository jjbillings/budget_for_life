require 'rails_helper'

RSpec.describe "positions/edit", type: :view do
  let(:position) { create(:position, { quantity: 2 }) }
  before(:each) { assign(:position, position) }

  it "renders the edit position form" do
    skip "Need to build out UI"
    render

    assert_select "form[action=?][method=?]", position_path(@position), "post" do

      assert_select "input[name=?]", "position[quantity]"

      assert_select "input[name=?]", "position[price]"

      assert_select "input[name=?]", "position[ticker]"
    end
  end
end
