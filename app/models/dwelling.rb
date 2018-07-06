class Dwelling < ApplicationRecord
  belongs_to :suburb, optional: true
end
