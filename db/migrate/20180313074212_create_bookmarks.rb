class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.integer :user2_id
      t.integer :hplace_id
      t.string :place_name
      t.string :category
      t.string :place_delete
      t.timestamps
    end
  end
end
