class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :type
      t.string :identifiant
      t.string :serial_number
      t.string :location
      t.text :detail
      t.date :commissioning_date
      t.date :validity_qualification
      t.date :preventive_maintenance
      t.string :status

      t.timestamps
    end
  end
end
