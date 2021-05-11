class ChangeStartDateToStartTime < ActiveRecord::Migration[6.0]
  def change
    rename_column :maintenances, :start_date, :start_time
  end
end
