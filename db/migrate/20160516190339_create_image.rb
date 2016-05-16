class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.has_attached_file :photo
      t.references :imageable, polymorphic: true
      t.timestamps null: false
    end
  end
end
