class RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reward, only: [:show]

  def index
    @rewards = Reward.all
  end

  def show
  end

  private

  def set_reward
    @reward = Reward.find_by_id(params[:id])
  end
end
