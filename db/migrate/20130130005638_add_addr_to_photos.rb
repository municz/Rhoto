class AddAddrToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :addr, :string
  end
end
