class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :title
      t.text :description
      t.integer :price_in_coins
      t.timestamps null: false
    end
  end
end
