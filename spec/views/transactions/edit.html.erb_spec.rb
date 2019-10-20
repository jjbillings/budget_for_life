require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  let!(:transaction) { create(:transaction) }
  before(:each) { assign(:transaction, transaction) }

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(transaction), "post" do

      assert_select "input[name=?]", "transaction[amount]"

      assert_select "input[name=?]", "transaction[description]"

      assert_select "input[name=?]", "transaction[vendor]"
    end
  end
end
