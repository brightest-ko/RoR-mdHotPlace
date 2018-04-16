class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :email
      t.string :phone
      t.string :level
      t.string :password_digest
      t.string :user_name

      t.timestamps
    end
  end
end
