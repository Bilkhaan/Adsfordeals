class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :visited_ads, dependent: :destroy
  has_many :recorded_items, dependent: :destroy
  has_many :content_items, through: :recorded_items
  has_many :payments, dependent: :destroy

  validates :username, presence: true

  before_create :assign_bonus_coins

  def mark_as_visited content_item
    visited_ad = self.visited_ads.find_or_initialize_by(ad_priority: content_item.priority)
    visited_ad.increment!(:count)
    recorded_item = self.recorded_items.find_or_initialize_by(content_item_id: content_item.id)
    recorded_item.update(last_viewed_at: Time.now)
    self.increment(:coins, content_item.coins)
    self.increment!(:watched_ads)
  end

  private

  def assign_bonus_coins
    self.coins = 500
  end
end
