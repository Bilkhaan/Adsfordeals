class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.text :highlight
      t.text :package
      t.string :facebook_link
      t.text :fine_print
      t.integer :price
      t.integer :price_after_discount
      t.integer :discount
      t.integer :coins
      t.integer :price_after_coins
      t.string :location
      t.datetime :valid_to
      t.timestamps null: false
    end
  end
end
