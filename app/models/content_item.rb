class ContentItem < ActiveRecord::Base
  CONTENT_TYPES = %w(web image video)
  CONTENT_PRIORITIES = %w(featured regular default)
end
