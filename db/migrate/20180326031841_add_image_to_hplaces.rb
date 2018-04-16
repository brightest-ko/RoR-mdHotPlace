class AddImageToHplaces < ActiveRecord::Migration[5.1]
    def change
      add_column :hplaces, :place_photo1, :string
      add_column :hplaces, :place_photo2, :string
      add_column :hplaces, :place_photo3, :string
      add_column :hplaces, :place_photo4, :string
      add_column :hplaces, :place_photo5, :string
    end
   end