class AddCreatorToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :creator, :integer
  end
end
