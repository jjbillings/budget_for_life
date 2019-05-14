require 'rails_helper'

RSpec.describe SavingsGoalsController, type: :controller do
  describe "#index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "returns a success response" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "returns a success response" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end
end
