class RecordedItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :content_item
end
