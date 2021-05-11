class ChangeTitleToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :maintenances, :title, :name
  end
end
