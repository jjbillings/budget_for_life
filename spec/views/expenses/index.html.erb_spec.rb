require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  let(:expenses) { create_list(:expense, 2) }
  before(:each) { assign(:expenses, expenses) }

  it "renders a list of expenses" do
    render
    assert_select "tr>td", :text => expenses.first.name, :count => 2
    assert_select "tr>td", :text => expenses.first.amount.to_s, :count => 2
    assert_select "tr>td", :text => format_status(expenses.first.status), :count => 2
    assert_select "tr>td", :text => expenses.first.target_date.to_s, :count => 2
    assert_select "tr>td", :text => "No", :count => 2
  end
end
