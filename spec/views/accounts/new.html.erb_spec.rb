require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  let!(:account) { create(:account) }
  before(:each) { assign(:account, account) }

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input[name=?]", "account[account_type]"

      assert_select "input[name=?]", "account[name]"
    end
  end
end
