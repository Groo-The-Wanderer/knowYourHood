require 'csv'

namespace :import do
  desc "Import School Profiles Data"
  task load_school_profiles_data: :environment do 
    SchoolProfile.destroy_all
    CSV.foreach('/Users/brendanleonard/wdi/projects/hood-notes/data_to_load/nsw_school_profiles.csv', headers: true) do |row|
      SchoolProfile.create(row.to_h)
    end
    puts "#{ SchoolProfile.count } records added to the SchoolProfiles table"
  end
end
