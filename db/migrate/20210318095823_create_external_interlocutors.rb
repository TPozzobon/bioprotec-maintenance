class CreateExternalInterlocutors < ActiveRecord::Migration[6.0]
  def change
    create_table :external_interlocutors do |t|
      t.string :name
      t.string :company
      t.string :phone_number
      t.string :mobile_number
      t.string :email

      t.timestamps
    end
  end
end
