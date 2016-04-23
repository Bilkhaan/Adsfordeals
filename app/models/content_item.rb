class ContentItem < ActiveRecord::Base
  obfuscate_id spin: 42864269

  CONTENT_TYPES = %w(web image video)
  CONTENT_PRIORITIES = %w(featured regular default)
end
