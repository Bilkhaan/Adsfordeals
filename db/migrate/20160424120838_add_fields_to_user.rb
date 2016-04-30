class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :coins, :integer, default: 0
    add_column :users, :watched_ads, :integer, default: 0
    add_column :users, :address, :text
    add_column :users, :phone, :string
  end
end
