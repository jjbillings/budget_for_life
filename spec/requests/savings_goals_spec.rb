require 'rails_helper'

RSpec.describe "SavingsGoals", type: :request do
  describe "GET /savings_goals" do
    it "works! (now write some real specs)" do
      get savings_goals_path
      expect(response).to have_http_status(200)
    end
  end
end
