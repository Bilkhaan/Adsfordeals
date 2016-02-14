class AddUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, limit: 100
  end
end
