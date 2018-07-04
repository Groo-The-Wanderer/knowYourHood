require 'csv'

namespace :import do
  desc "Import Suburb Data"
  task load_suburb_ref: :environment do 
    Suburb.destroy_all
    CSV.foreach('/Users/brendanleonard/wdi/projects/hood-notes/data_to_load/nsw_suburb_data_to_be_loaded.csv', headers: true) do |row|
      Suburb.create(row.to_h)
    end
    puts "#{ Suburb.count } records added to the Suburbs table"
  end
end
