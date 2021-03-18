class CreateMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :status


      t.timestamps
    end
  end
end
