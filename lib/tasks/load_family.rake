require 'csv'

namespace :import do
  desc "Import Families Data"
  task load_families_data: :environment do 
    Family.destroy_all
    CSV.foreach('/Users/brendanleonard/wdi/projects/hood-notes/data_to_load/load_data_families.csv', headers: true) do |row|
      Family.create(row.to_h)
    end
    puts "#{ Family.count } records added to the Families table"
  end
end
