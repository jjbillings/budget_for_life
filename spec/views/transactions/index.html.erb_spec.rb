require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  let(:expense) { create(:expense, user: user) }
  let(:account) { create(:account, user: user) }

  let(:transactions) { create_list(:transaction, 2, { account: account, expense: expense }) }
  before(:each) { assign(:transactions, transactions) }

  it "renders a list of transactions" do
    render
    transactions.each do |transaction|
      assert_select "tr>td", :text => number_to_currency(transaction.amount)
      assert_select "tr>td", :text => transaction.posting_date
      assert_select "tr>td", :text => transaction.description.to_s
      assert_select "tr>td", :text => transaction.vendor.to_s
    end
  end
end
