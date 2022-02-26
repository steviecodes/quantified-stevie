class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.string :album_name
      t.string :isrc
      t.string :name
      t.datetime :played_at
      t.string :preview_url
      t.string :spotify_id
      t.string :artist

      t.timestamps
    end
  end
end
