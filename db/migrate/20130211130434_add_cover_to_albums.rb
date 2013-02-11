class AddCoverToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :Cover, :integer
  end
end
