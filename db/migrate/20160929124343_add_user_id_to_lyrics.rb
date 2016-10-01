class AddUserIdToLyrics < ActiveRecord::Migration
  def change
    add_column :lyrics, :user_id, :integer
    add_index :lyrics, :user_id
  end
end
