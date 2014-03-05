class AddPhotoIdToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :photo_id, :integer
  end
end
