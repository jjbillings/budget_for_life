require "rails_helper"

RSpec.describe SavingsGoalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/savings_goals").to route_to("savings_goals#index")
    end

    it "routes to #new" do
      expect(:get => "/savings_goals/new").to route_to("savings_goals#new")
    end

    it "routes to #show" do
      expect(:get => "/savings_goals/1").to route_to("savings_goals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/savings_goals/1/edit").to route_to("savings_goals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/savings_goals").to route_to("savings_goals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/savings_goals/1").to route_to("savings_goals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/savings_goals/1").to route_to("savings_goals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/savings_goals/1").to route_to("savings_goals#destroy", :id => "1")
    end
  end
end
