class CreateRecordedItems < ActiveRecord::Migration
  def change
    create_table :recorded_items do |t|
      t.belongs_to :user, index: true
      t.belongs_to :content_item, index: true
      t.datetime :last_viewed_at
      t.timestamps null: false
    end
  end
end
