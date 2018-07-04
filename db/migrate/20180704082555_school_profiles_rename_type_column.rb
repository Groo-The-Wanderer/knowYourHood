class SchoolProfilesRenameTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :school_profiles, :type, :school_type
  end
end
