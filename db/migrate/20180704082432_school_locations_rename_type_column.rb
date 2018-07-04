class SchoolLocationsRenameTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :school_locations, :type, :school_type
  end
end
