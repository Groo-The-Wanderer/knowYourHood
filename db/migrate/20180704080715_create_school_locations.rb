class CreateSchoolLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :school_locations do |t|
      t.integer :school_id
      t.string :name
      t.string :suburb
      t.string :state
      t.integer :postcode
      t.string :sector
      t.string :type
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
