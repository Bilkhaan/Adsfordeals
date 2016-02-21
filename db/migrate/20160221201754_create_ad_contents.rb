class CreateAdContents < ActiveRecord::Migration
  def change
    create_table :ad_contents do |t|
      t.string :title
      t.text :description
      t.string :ad_type, limit: 20
      t.string :priority, limit: 20
      t.integer :coins
      t.string :content
      t.timestamps null: false
    end
  end
end
