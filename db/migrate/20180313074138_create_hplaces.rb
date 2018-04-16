class CreateHplaces < ActiveRecord::Migration[5.1]
  def change
    create_table :hplaces do |t|
      t.string :place_name
      t.string :place_address
      t.string :place_call
     
      t.string :site
      t.string :optime
      t.string :park
      t.string :ad
      t.string :category
      t.text :remarks
      t.text :intro
      t.integer :views, null: false, default: 0
      t.float  :avg_evalu, null: false, default: 0.0
      t.integer :reviewcount, null: false, default: 0
      t.timestamps
    end
  end
end
