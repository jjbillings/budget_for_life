require 'rails_helper'

RSpec.describe SavingsGoalsController, type: :controller do
  let(:user) { create(:user) }

  # This should return the minimal set of attributes required to create a valid
  # SavingsGoal. As you add validations to SavingsGoal, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:savings_goal).merge({ user_id: user.id })
  }

  let(:invalid_attributes) {
    { target_amount: "asdf" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SavingsGoalsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    let(:savings_goal) { create(:savings_goal) }

    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:savings_goal) { create(:savings_goal) }

    describe "with a valid id" do
      before { get :show, params: {id: savings_goal.to_param}, session: valid_session }

      it "returns a success response" do
        expect(response).to be_successful
      end

      it "assigns the correct savings_goal" do
        expect(assigns(:savings_goal)).to eq savings_goal
      end
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    let(:savings_goal) { create(:savings_goal) }

    it "returns a success response" do
      get :edit, params: {id: savings_goal.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SavingsGoal" do
        expect {
          post :create, params: {savings_goal: valid_attributes}, session: valid_session
        }.to change(SavingsGoal, :count).by(1)
      end

      it "redirects to the created savings_goal" do
        post :create, params: {savings_goal: valid_attributes}, session: valid_session
        expect(response).to redirect_to(SavingsGoal.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {savings_goal: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "a new name", target_date: Date.new(2011, 4, 20), strict_target_date: false,
          target_amount: 666.02, current_amount: 0.0
        }
      }

      it "updates the requested savings_goal" do
        savings_goal = SavingsGoal.create! valid_attributes
        put :update, params: {id: savings_goal.to_param, savings_goal: new_attributes}, session: valid_session
        savings_goal.reload
        expect(savings_goal.name).to eq(new_attributes[:name])
        expect(savings_goal.target_date).to eq(new_attributes[:target_date])
        expect(savings_goal.strict_target_date).to eq(new_attributes[:strict_target_date])
        expect(savings_goal.target_amount).to eq(new_attributes[:target_amount])
        expect(savings_goal.current_amount).to eq(new_attributes[:current_amount])
      end

      it "redirects to the savings_goal" do
        savings_goal = SavingsGoal.create! valid_attributes
        put :update, params: {id: savings_goal.to_param, savings_goal: valid_attributes}, session: valid_session
        expect(response).to redirect_to(savings_goal)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        savings_goal = SavingsGoal.create! valid_attributes
        put :update, params: {id: savings_goal.to_param, savings_goal: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested savings_goal" do
      savings_goal = SavingsGoal.create! valid_attributes
      expect {
        delete :destroy, params: {id: savings_goal.to_param}, session: valid_session
      }.to change(SavingsGoal, :count).by(-1)
    end

    it "redirects to the savings_goals list" do
      savings_goal = SavingsGoal.create! valid_attributes
      delete :destroy, params: {id: savings_goal.to_param}, session: valid_session
      expect(response).to redirect_to(savings_goals_url)
    end
  end

end
