class ContentItem < ActiveRecord::Base
  obfuscate_id spin: 42864269

  has_many :recorded_items, dependent: :destroy
  has_many :users, through: :recorded_items

  CONTENT_TYPES = %w(web image video)
  CONTENT_PRIORITIES = %w(featured regular default)

  def not_allowed recorded_items
    return false unless recorded_items.present?
    recorded_item = recorded_items.find_by_content_item_id(self.id)
    recorded_item.last_viewed_at.to_date >= Date.today
  end
end
