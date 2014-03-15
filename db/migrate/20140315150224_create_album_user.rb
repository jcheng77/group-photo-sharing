class CreateAlbumUser < ActiveRecord::Migration
  def up
    create_table :albums_users, :id => false do |t|
      t.references :user
      t.references :album
      t.timestamps
    end
  end

  def down
    drop_table :albums_users
  end
end
