class RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reward, only: [:show, :purchase]

  def index
    @rewards = Reward.all
  end

  def show
  end

  def purchase
    @payment_success  = @reward.record_payment(params, current_user)

    respond_to do |format|
      format.js
    end
  end

  private

  def set_reward
    @reward = Reward.find_by_id(params[:id])
  end
end
