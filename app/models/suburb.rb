class Suburb < ApplicationRecord
  has_one :family, primary_key: :abs_ssc, foreign_key: :abs_ssc
  has_one :dwelling, primary_key: :abs_ssc, foreign_key: :abs_ssc
  has_one :homeownership, primary_key: :abs_ssc, foreign_key: :abs_ssc
  has_one :snapshot, primary_key: :abs_ssc, foreign_key: :abs_ssc
end
