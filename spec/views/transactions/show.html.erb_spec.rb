require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  let!(:transaction) { create(:transaction) }
  before(:each) { assign(:transaction, transaction) }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Vendor/)
  end
end
