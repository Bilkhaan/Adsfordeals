class ContentItem < ActiveRecord::Base
  obfuscate_id spin: 42864269

  scope :active_ads, -> { where(is_active: true) }

  has_many :recorded_items, dependent: :destroy
  has_many :users, through: :recorded_items

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: lambda { |attributes| attributes[:photo].blank? }, allow_destroy: true

  CONTENT_TYPES = %w(web image video)
  CONTENT_PRIORITIES = %w(featured regular default)

  def not_allowed recorded_items
    return false unless recorded_items.present?
    recorded_item = recorded_items.find_by_content_item_id(self.id)
    return false if recorded_item.blank?
    hours_diff = ((Time.now - recorded_item.last_viewed_at) / 1.hour).round
    hours_diff < 24
  end

  def main_image
    self.images.present? ? self.images.first.photo.url(:thumb) : 'default.jpg'
  end

  def is_video?
    self.ad_type == 'video'
  end

  def video_object
    VideoInfo.new(self.content)
  end
end
