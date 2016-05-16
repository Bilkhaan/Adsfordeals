class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: ['image/png', 'image/jpeg']
end
