require 'rails_helper'

RSpec.describe "positions/show", type: :view do
  let(:position) { create(:position, { quantity: 2 }) }
  before(:each) { assign(:position, position) }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Ticker/)
  end
end
