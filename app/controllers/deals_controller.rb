class DealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deal, only: [:show, :purchase]

  def index
    @deals = Deal.all
  end

  # def show
  # end

  # def purchase
  #   @payment_success  = @deal.record_payment(params, current_user)

  #   respond_to do |format|
  #     format.js
  #   end
  # end

  private

  def set_deal
    @deal = Deal.find_by_id(params[:id])
  end
end
