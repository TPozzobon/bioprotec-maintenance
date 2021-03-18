class CreateMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :status
      t.references :equipment, null: false, foreign_key: true
      t.references :externalinterlocutor, null: false, foreign_key: true
      t.references :internalinterlocutor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
