class ChangeDateToDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :maintenances, :start_time, :datetime
  end
end
