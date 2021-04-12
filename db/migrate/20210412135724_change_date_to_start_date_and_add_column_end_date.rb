class ChangeDateToStartDateAndAddColumnEndDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :maintenances, :date, :start_date
    add_column :maintenances, :end_date, :date
  end
end
