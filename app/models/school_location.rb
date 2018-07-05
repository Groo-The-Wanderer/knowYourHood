class SchoolLocation < ApplicationRecord
  geocoded_by :name, latitude: :lat, longitude: :lng
  has_one :school_profile, primary_key: :school_id, foreign_key: :school_id
end
