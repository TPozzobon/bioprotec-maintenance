class AddColumnEndDateContractToEquipmment < ActiveRecord::Migration[6.0]
  def change
    add_column :equipment, :end_contract, :date
  end
end
