require 'csv'

namespace :import do
  desc "Import Families Data"
  task load_families_data: :environment do 
    Family.destroy_all
    CSV.foreach('./db/source-data/load_data_families.csv', headers: true) do |row|
      Family.create(row.to_h)
    end
    puts "#{ Family.count } records added to the Families table"
  end
end
