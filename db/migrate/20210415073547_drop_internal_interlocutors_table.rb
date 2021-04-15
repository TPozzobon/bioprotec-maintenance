class DropInternalInterlocutorsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :internal_interlocutors
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
