class AddExifColumnsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :title, :string
    add_column :photos, :description, :string
    add_column :photos, :longitude, :string
    add_column :photos, :latitude, :string
  end
end
