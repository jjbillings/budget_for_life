require 'rails_helper'

RSpec.describe "expenses/new", type: :view do
  let!(:expense) { create(:expense) }
  before(:each) { assign(:expense, expense) }

  it "renders new expense form" do
    skip "Need to build out the UI"
    render

    assert_select "form[action=?][method=?]", expenses_path, "post" do

      assert_select "input[name=?]", "expense[name]"

      assert_select "input[name=?]", "expense[amount]"

      assert_select "input[name=?]", "expense[status]"
    end
  end
end
