class SchoolProfile < ApplicationRecord
  belongs_to :school_location, optional: true
end
