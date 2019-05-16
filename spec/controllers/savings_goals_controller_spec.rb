require 'rails_helper'

RSpec.describe SavingsGoalsController, type: :controller do
  describe "#index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @savings_goals" do
      savings_goal = create(:savings_goal)
      get :index
      expect(assigns(:savings_goals)).to eq([savings_goal])
    end
  end

  describe "#new" do
    it "returns a success response" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    let(:valid_attributes) { {savings_goal: attributes_for(:savings_goal)} }

    it "returns a success response" do
      post :create, params: valid_attributes
      expect(response).to have_http_status(:redirect)
    end

    it "saves the model" do
      post :create, params: valid_attributes
      expect(assigns(:savings_goal)).to be_a(SavingsGoal)
    end
  end
end
