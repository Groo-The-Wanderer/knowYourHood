class ChangeAbsSscType < ActiveRecord::Migration[5.2]
  def change
      change_column :suburbs, :abs_ssc, :string
  end
end
