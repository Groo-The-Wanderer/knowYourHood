class SchoolLocation < ApplicationRecord
  geocoded_by :name, latitude: :lat, longitude: :lng
end
