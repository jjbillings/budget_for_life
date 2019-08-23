require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  let(:accounts) { create_list(:account, 2) }
  before(:each) { assign(:accounts, accounts) }

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => accounts.first.account_type.to_s, :count => 2
    assert_select "tr>td", :text => accounts.first.name, :count => 2
  end
end
