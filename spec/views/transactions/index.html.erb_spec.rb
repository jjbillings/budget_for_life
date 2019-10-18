require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  let(:transactions) { create_list(:transaction, 2) }
  before(:each) { assign(:transactions, transactions) }

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor".to_s, :count => 2
  end
end
