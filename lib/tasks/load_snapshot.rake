require 'csv'

namespace :import do
  desc "Import Demographic Snapshot Data"
  task load_snapshot_data: :environment do 
    Snapshot.destroy_all
    CSV.foreach('/Users/brendanleonard/wdi/projects/hood-notes/data_to_load/load_data_demographic_snapshot.csv', headers: true) do |row|
      Snapshot.create(row.to_h)
    end
    puts "#{ Snapshot.count } records added to the Demographic Snapshot table"
  end
end
