require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  let!(:account) { create(:account) }
  before(:each) { assign(:account, account) }

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(account), "post" do

      assert_select "input[name=?]", "account[account_type]"

      assert_select "input[name=?]", "account[name]"
    end
  end
end
