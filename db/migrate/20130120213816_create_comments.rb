class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.string :user
      t.references :photo

      t.timestamps
    end
  end
end
