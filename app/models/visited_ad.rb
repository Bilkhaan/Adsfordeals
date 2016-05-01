class VisitedAd < ActiveRecord::Base
  belongs_to :user

  def priority
    self.ad_priority.capitalize
  end
end
