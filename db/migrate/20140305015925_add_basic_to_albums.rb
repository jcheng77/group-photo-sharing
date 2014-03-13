class AddBasicToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :creation_date, :date
    add_column :albums, :creator, :string
  end
end
