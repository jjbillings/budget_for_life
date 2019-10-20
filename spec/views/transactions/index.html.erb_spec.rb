require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  let(:transactions) { create_list(:transaction, 2) }
  before(:each) { assign(:transactions, transactions) }

  it "renders a list of transactions" do
    render
    transactions.each do |transaction|
      assert_select "tr>td", :text => transaction.amount.to_s
      assert_select "tr>td", :text => transaction.description.to_s
      assert_select "tr>td", :text => transaction.vendor.to_s
    end
  end
end
