class AddStatusToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status, :string, default: "Actif"
  end
end
