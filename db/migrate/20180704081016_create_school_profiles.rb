class CreateSchoolProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :school_profiles do |t|
      t.integer :school_id
      t.string :name
      t.string :suburb
      t.string :state
      t.integer :postcode
      t.string :sector
      t.string :type
      t.string :website
      t.string :year_range
      t.integer :teaching_staff
      t.integer :non_teaching_staff
      t.integer :total_enrolments
      t.integer :girls_enrolments
      t.integer :boys_enrolments

      t.timestamps
    end
  end
end
