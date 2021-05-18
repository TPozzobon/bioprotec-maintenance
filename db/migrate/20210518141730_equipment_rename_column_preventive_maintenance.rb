class EquipmentRenameColumnPreventiveMaintenance < ActiveRecord::Migration[6.0]
  def change
    rename_column :equipment, :preventive_maintenance, :signature_date
  end
end
