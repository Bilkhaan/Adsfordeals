class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_visited_ads

  def analytics
  end

  private

  def set_visited_ads
    @visited_ads = current_user.visited_ads
  end
end
