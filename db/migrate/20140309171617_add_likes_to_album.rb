class AddLikesToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :likes, :integer
  end
end
