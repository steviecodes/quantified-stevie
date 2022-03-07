class AddImage640ToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :image_640, :string
  end
end
