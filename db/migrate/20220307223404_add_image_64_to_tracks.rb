class AddImage64ToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :image_64, :string
  end
end
