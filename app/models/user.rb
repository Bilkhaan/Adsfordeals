class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :visited_ads, dependent: :destroy

  validates :username, presence: true

  def mark_as_visited content_item
    visited_ad = self.visited_ads.find_or_initialize_by(ad_priority: content_item.priority)
    visited_ad.increment(:count)
    self.increment(:coins, content_item.coins)
    self.increment(:watched_ads)
    self.save
  end
end
