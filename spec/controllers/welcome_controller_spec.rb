require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET #index" do
    let(:user) { create(:user) }

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
