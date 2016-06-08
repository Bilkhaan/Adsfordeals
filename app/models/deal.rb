class Deal < ActiveRecord::Base
  has_many :images, as: :imageable, dependent: :destroy
  has_many :payments, as: :paymentable, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: lambda { |attributes| attributes[:photo].blank? }, allow_destroy: true

  def main_image
    self.images.present? ? self.images.first.photo.url(:thumb) : 'default.jpg'
  end
end
