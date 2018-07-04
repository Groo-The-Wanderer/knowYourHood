class CreateSnapshots < ActiveRecord::Migration[5.2]
  def change
    create_table :snapshots do |t|
      t.string :abs_ssc
      t.integer :median_age
      t.integer :median_monthly_mortgage_payments
      t.integer :median_weekly_rental_payments
      t.integer :median_individual_income
      t.integer :median_household_income
      t.float :avg_household_size

      t.timestamps
    end
  end
end
