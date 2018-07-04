class CreateHomeownerships < ActiveRecord::Migration[5.2]
  def change
    create_table :homeownerships do |t|
      t.string :abs_ssc
      t.integer :total_dwellings
      t.integer :outright_total
      t.integer :outright_houses
      t.integer :outright_townhouses
      t.integer :outright_flats
      t.integer :mortgage_total
      t.integer :mortgage_houses
      t.integer :mortgage_townhouses
      t.integer :mortgage_flats
      t.integer :rented_total
      t.integer :rented_houses
      t.integer :rented_townhouses
      t.integer :rented_flats
      t.integer :others_total

      t.timestamps
    end
  end
end
