class CreateInternalInterlocutors < ActiveRecord::Migration[6.0]
  def change
    create_table :internal_interlocutors do |t|
      t.string :visa
      t.string :phone_number

      t.timestamps
    end
  end
end
