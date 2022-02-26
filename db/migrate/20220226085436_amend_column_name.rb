class AmendColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :tracks, :artist, :artists
  end
end
