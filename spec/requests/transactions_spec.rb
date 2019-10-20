require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe "GET /transactions" do
    it "works! (now write some real specs)" do
      get transactions_path
      expect(response).to have_http_status(200)
    end
  end
end
