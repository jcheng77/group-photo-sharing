class AddColumnsToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image_size, :string
    add_column :photos, :datetime_original, :date
  end
end
