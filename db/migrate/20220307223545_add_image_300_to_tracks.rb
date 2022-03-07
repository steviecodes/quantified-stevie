class AddImage300ToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :image_300, :string
  end
end
