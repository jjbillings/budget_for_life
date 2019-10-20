require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  let!(:transaction) { create(:transaction) }
  before(:each) { assign(:transaction, transaction) }

  it "renders new transaction form" do
    skip "Need to build out the UI"
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input[name=?]", "transaction[amount]"

      assert_select "input[name=?]", "transaction[description]"

      assert_select "input[name=?]", "transaction[vendor]"
    end
  end
end
