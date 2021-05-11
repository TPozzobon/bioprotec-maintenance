class ChangeEndDateToEndDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :maintenances, :end_time, :datetime
  end
end
