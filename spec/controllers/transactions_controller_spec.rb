require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:account) { create(:account) }
  let(:expense){ create(:expense) }

  # This should return the minimal set of attributes required to create a valid
  # Transaction. As you add validations to Transaction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:transaction).merge({
      account_id: account.id,
      expense_id: expense.id
    })
  }

  let(:invalid_attributes) {
    { amount: "twenty one" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TransactionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      create(:transaction)
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:transaction) { create(:transaction) }

    it "returns a success response" do
      get :show, params: {id: transaction.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    let(:transaction) { create(:transaction) }

    it "returns a success response" do
      get :edit, params: {id: transaction.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Transaction" do
        expect {
          post :create, params: {transaction: valid_attributes}, session: valid_session
        }.to change(Transaction, :count).by(1)
      end

      it "redirects to the created transaction" do
        post :create, params: {transaction: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Transaction.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {transaction: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          amount: 300,
          description: "a new description",
          vendor: "totally_diff_vendor"
        }
      }

      it "updates the requested transaction" do
        transaction = Transaction.create! valid_attributes
        put :update, params: {id: transaction.to_param, transaction: new_attributes}, session: valid_session
        transaction.reload
        # Not sure if it's sketchy to iterate over new_attributes
        new_attributes.each do |key, value|
          expect(transaction.public_send(key)).to eq(value)
        end
      end

      it "redirects to the transaction" do
        transaction = Transaction.create! valid_attributes
        put :update, params: {id: transaction.to_param, transaction: valid_attributes}, session: valid_session
        expect(response).to redirect_to(transaction)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        transaction = Transaction.create! valid_attributes
        put :update, params: {id: transaction.to_param, transaction: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested transaction" do
      transaction = Transaction.create! valid_attributes
      expect {
        delete :destroy, params: {id: transaction.to_param}, session: valid_session
      }.to change(Transaction, :count).by(-1)
    end

    it "redirects to the transactions list" do
      transaction = Transaction.create! valid_attributes
      delete :destroy, params: {id: transaction.to_param}, session: valid_session
      expect(response).to redirect_to(transactions_url)
    end
  end

end
