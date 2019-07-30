require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  let!(:account) { create(:account) }
  before(:each) { assign(:account, account) }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
  end
end
