require 'csv'

namespace :import do
  desc "Import School Locations Data"
  task load_school_locations_data: :environment do 
    SchoolLocation.destroy_all
    CSV.foreach('/Users/brendanleonard/wdi/projects/hood-notes/data_to_load/nsw_school_locations.csv', headers: true) do |row|
      SchoolLocation.create(row.to_h)
    end
    puts "#{ SchoolLocation.count } records added to the SchoolLocations table"
  end
end
