class AddUserToMaintenances < ActiveRecord::Migration[6.0]
  def change
    add_reference :maintenances, :user, null: false, foreign_key: true
  end
end
