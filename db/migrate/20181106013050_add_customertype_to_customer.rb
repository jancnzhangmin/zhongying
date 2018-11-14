class AddCustomertypeToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :customertype_id, :bigint
  end
end
