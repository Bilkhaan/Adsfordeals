class HomesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @ads = ContentItem.active_ads
    @featured = @ads.where(priority: 'featured')
    @regular = @ads.where(priority: 'regular')
    @default = @ads.where(priority: 'default')
    @recorded_items = current_user.recorded_items
  end
end
