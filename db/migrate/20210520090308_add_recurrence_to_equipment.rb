class AddRecurrenceToEquipment < ActiveRecord::Migration[6.0]
  def change
    add_column :equipment, :recurrence, :string
  end
end
