class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :equipment, :type, :name
  end
end
