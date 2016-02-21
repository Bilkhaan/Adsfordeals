class HomesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @ads = Ad.all
    @featured = @ads.where(priority: 'featured')
    @regular = @ads.where(priority: 'regular')
    @default = @ads.where(priority: 'default')
  end
end
