class RemoveExtra < ActiveRecord::Migration[6.0]
  def change
    remove_column :maintenances, :external_interlocutor_id
  end
end
