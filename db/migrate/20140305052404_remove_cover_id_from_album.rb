class RemoveCoverIdFromAlbum < ActiveRecord::Migration
  def up
    remove_column :albums, :cover_id
  end

  def down
    add_column :albums, :cover_id, :integer
  end
end
