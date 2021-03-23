class RemoveIntra < ActiveRecord::Migration[6.0]
  def change
    remove_column :maintenances, :internal_interlocutor_id
  end
end
