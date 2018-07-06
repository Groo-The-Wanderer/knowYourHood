class Family < ApplicationRecord
  belongs_to :suburb, optional: true
end
