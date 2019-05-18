class SavingsGoalsController < ApplicationController
  def index
    @savings_goals = SavingsGoal.all
  end

  def show
    @savings_goal = SavingsGoal.find(params[:id])
  end

  def new
  end

  def create
    @savings_goal = SavingsGoal.new(savings_goal_params)

    begin
      @savings_goal.save!
      redirect_to @savings_goal
    rescue
      render :new
    end
  end

  def edit
  end

  def update
    @savings_goal = SavingsGoal.find(params[:id])
    params[:savings_goal].each do |param, val|
      @savings_goal[param] = val
    end

    begin
      @savings_goal.save!

      redirect_to @savings_goal
    rescue
      render :edit
    end
  end

  def destroy
    @savings_goal = SavingsGoal.find(params[:id])
    @savings_goal.destroy!

    redirect_to savings_goals_url
  end

  private

  def savings_goal_params
    params.require(:savings_goal).permit(:name,
      :target_date, :strict_target_date, :target_amount,
      :current_amount)
  end
end
