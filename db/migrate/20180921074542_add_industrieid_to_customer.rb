class AddIndustrieidToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :industrie_id, :bigint
  end
end
