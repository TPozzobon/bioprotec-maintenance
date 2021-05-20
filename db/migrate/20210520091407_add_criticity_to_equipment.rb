class AddCriticityToEquipment < ActiveRecord::Migration[6.0]
  def change
    add_column :equipment, :criticity, :boolean
  end
end
