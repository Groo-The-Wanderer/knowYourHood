class Snapshot < ApplicationRecord
  belongs_to :suburb, optional: true
end
