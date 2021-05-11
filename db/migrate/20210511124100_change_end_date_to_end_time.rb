class ChangeEndDateToEndTime < ActiveRecord::Migration[6.0]
  def change
    rename_column :maintenances, :end_date, :end_time
  end
end
