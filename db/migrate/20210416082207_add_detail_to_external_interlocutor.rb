class AddDetailToExternalInterlocutor < ActiveRecord::Migration[6.0]
  def change
    add_column :external_interlocutors, :detail, :text
  end
end
