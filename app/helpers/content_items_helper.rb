module ContentItemsHelper
  def is_viewed content_item, recorded_items
    'disabled' if content_item.not_allowed(recorded_items)
  end
end
