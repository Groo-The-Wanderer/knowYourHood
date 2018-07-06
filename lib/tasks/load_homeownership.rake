require 'csv'

namespace :import do
  desc "Import Homeownership Data"
  task load_homeownership_data: :environment do 
    Homeownership.destroy_all
    CSV.foreach('./db/source-data/load_data_home_ownership.csv', headers: true) do |row|
      Homeownership.create(row.to_h)
    end
    puts "#{ Homeownership.count } records added to the Homeownerships table"
  end
end
