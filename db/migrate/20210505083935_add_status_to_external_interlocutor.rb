class AddStatusToExternalInterlocutor < ActiveRecord::Migration[6.0]
  def change
    add_column :external_interlocutors, :status, :string, default: "Actif"
  end
end
