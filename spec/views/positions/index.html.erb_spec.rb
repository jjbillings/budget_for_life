require 'rails_helper'

RSpec.describe "positions/index", type: :view do
  let(:positions) { create_list(:position, 2) }
  before(:each) { assign(:positions, positions) }

  it "renders a list of positions" do
    render
    assert_select "tr>td", :text => positions.first.quantity.to_s, :count => 2
    assert_select "tr>td", :text => positions.first.price.to_s, :count => 2
    assert_select "tr>td", :text => positions.first.ticker.to_s, :count => 2
  end
end
