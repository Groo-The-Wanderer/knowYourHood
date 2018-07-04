class CreateSuburbs < ActiveRecord::Migration[5.2]
  def change
    create_table :suburbs do |t|
      t.string :abs_ssc
      t.string :name
      t.string :state
      t.float :area

      t.timestamps
    end
  end
end
