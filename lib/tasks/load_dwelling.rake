require 'csv'

namespace :import do
  desc "Import Dwellings Data"
  task load_dwellings_data: :environment do 
    Dwelling.destroy_all
    CSV.foreach('./db/source-data/load_data_dwellings.csv', headers: true) do |row|
      Dwelling.create(row.to_h)
    end
    puts "#{ Dwelling.count } records added to the Dwellings table"
  end
end
