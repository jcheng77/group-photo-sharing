class AddViewsToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :views, :integer
  end
end
