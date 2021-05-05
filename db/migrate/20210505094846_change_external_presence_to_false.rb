class ChangeExternalPresenceToFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :maintenances, :external_interlocutor_id, :bigint, null: true
  end
end
