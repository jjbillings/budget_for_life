require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  let(:expense) { create(:expense, user: user) }
  let(:account) { create(:account, user: user) }
  let!(:transaction) { create(:transaction, { account: account, expense: expense }) }

  before(:each) { assign(:transaction, transaction) }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{transaction.amount}/)
    expect(rendered).to match(/#{transaction.posting_date}/)
    expect(rendered).to match(/#{transaction.description}/)
    expect(rendered).to match(/#{transaction.vendor}/)
  end
end
