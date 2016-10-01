class AddYoutubeLinkToLyrics < ActiveRecord::Migration
  def change
    add_column :lyrics, :youtube_link, :string
  end
end
