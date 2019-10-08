require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  let!(:expense) { create(:expense) }
  before(:each) { assign(:expense, expense) }

  it "renders the edit expense form" do
    render

    assert_select "form[action=?][method=?]", expense_path(expense), "post" do

      assert_select "input[name=?]", "expense[name]"

      assert_select "input[name=?]", "expense[amount]"

      assert_select "input[name=?]", "expense[status]"
    end
  end
end
