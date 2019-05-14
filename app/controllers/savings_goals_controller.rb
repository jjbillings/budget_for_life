class SavingsGoalsController < ApplicationController
  def index
  end

  def new
  end

  def create
    render plain: params[:savings_goal].inspect
  end
end
