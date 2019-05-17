class SavingsGoalsController < ApplicationController
  def index
    @savings_goals = SavingsGoal.all
  end

  def show
  end

  def new
  end

  def create
    @savings_goal = SavingsGoal.new(savings_goal_params)

    @savings_goal.save!
    redirect_to @savings_goal
  end

  def edit
  end

  def update
    @savings_goal = SavingsGoal.find(params[:id])
    params[:savings_goal].each do |param, val|
      @savings_goal[param] = val
    end

    @savings_goal.save!

    redirect_to @savings_goal
  end

  def destroy
  end

  private

  def savings_goal_params
    params.require(:savings_goal).permit(:name,
      :target_date, :strict_target_date, :target_amount,
      :current_amount)
  end
end
