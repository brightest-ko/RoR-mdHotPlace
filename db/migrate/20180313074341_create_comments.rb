class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :hplace_id
      t.string :place_name
      t.string :category
      t.string :place_delete
      t.integer :user2_id
      t.string :user_id
      t.text :content
      t.string :evalu
      t.string :comment_photo1
      t.string :comment_photo2
      t.timestamps
    end
  end
end
