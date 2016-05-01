class HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_all_ads

  def dashboard
    @recorded_items = current_user.recorded_items
  end

  private

  def set_all_ads
    @ads = ContentItem.active_ads
    @featured = @ads.where(priority: 'featured')
    @regular = @ads.where(priority: 'regular')
    @default = @ads.where(priority: 'default')
  end
end
