require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  let!(:transaction) { create(:transaction) }
  before(:each) { assign(:transaction, transaction) }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{transaction.amount}/)
    expect(rendered).to match(/#{transaction.description}/)
    expect(rendered).to match(/#{transaction.vendor}/)
  end
end
