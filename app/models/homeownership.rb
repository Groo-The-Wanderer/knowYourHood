class Homeownership < ApplicationRecord
  belongs_to :suburb, optional: true
end
