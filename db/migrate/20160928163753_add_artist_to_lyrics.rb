class AddArtistToLyrics < ActiveRecord::Migration
  def change
    add_column :lyrics, :artist, :string
  end
end
