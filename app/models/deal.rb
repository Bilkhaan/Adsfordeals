class Deal < ActiveRecord::Base
  has_many :images, as: :imageable, dependent: :destroy
  has_many :payments, as: :paymentable, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: lambda { |attributes| attributes[:photo].blank? }, allow_destroy: true

  def main_image
    self.images.present? ? self.images.first.photo.url(:medium) : 'default.jpg'
  end

  def record_payment user
    payment = self.payments.new(user_id: user.id, quantity: 1, price_per_unit: self.price_after_discount, method: 'coins', total_amount: self.price_after_discount)
    payment.save
  end
end
