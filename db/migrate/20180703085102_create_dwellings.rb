class CreateDwellings < ActiveRecord::Migration[5.2]
  def change
    create_table :dwellings do |t|
      t.string :abs_ssc
      t.integer :num_houses
      t.integer :num_townhouses
      t.integer :num_flats
      t.integer :num_others
      t.integer :tot_dwellings

      t.timestamps
    end
  end
end
