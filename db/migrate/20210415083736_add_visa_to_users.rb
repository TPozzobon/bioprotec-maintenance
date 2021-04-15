class AddVisaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :visa, :string
  end
end
