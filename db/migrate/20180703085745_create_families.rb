class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string :abs_ssc
      t.integer :tot_families
      t.integer :no_kids
      t.integer :kids_u15
      t.integer :kids_over15
      t.integer :tot_single_parent_families
      t.integer :single_parent_kids_u15
      t.integer :single_parent_kids_over15

      t.timestamps
    end
  end
end
