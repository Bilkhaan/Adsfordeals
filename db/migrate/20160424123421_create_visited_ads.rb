class CreateVisitedAds < ActiveRecord::Migration
  def change
    create_table :visited_ads do |t|
      t.string :ad_priority, limit: 25
      t.integer :count
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
