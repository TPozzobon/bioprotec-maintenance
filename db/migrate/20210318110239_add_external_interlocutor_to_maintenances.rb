class AddExternalInterlocutorToMaintenances < ActiveRecord::Migration[6.0]
  def change
    add_reference :maintenances, :external_interlocutor, null: false, foreign_key: true
  end
end
