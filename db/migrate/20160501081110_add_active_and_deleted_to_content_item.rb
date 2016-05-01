class AddActiveAndDeletedToContentItem < ActiveRecord::Migration
  def change
    add_column :content_items, :is_active, :boolean, default: true
    add_column :content_items, :is_deleted, :boolean, default: false

    add_index :content_items, :is_active
    add_index :content_items, :is_deleted
  end
end
