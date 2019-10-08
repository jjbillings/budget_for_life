require 'rails_helper'

RSpec.describe "expenses/show", type: :view do
  let!(:expense) { create(:expense) }
  before(:each) { assign(:expense, expense) }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(expense.name)
    expect(rendered).to match(expense.amount.to_s)
    expect(rendered).to match(expense.status.to_s)
  end
end
