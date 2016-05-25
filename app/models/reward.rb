class Reward < ActiveRecord::Base
  has_many :images, as: :imageable, dependent: :destroy
  has_many :payments, as: :paymentable, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: lambda { |attributes| attributes[:photo].blank? }, allow_destroy: true

  def main_image
    self.images.present? ? self.images.first.photo.url(:thumb) : 'default.jpg'
  end

  def record_payment params, user
    success = false
    return success if user.coins < self.price_in_coins
    Reward.transaction do
      coins = user.coins - self.price_in_coins
      payment = self.payments.new(user_id: user.id, quantity: 1, price_per_unit: self.price_in_coins, method: 'coins', total_amount: self.price_in_coins)
      success = true if user.update(coins: coins) && payment.save
    end
    success
  end
end
