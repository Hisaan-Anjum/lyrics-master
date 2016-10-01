class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.string :name
      t.text :description
      t.text :lyrics

      t.timestamps null: false
    end
  end
end
