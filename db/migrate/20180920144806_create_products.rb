class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.bigint :customer_id
      t.bigint :productdef_id
      t.float :price
      t.float :number
      t.datetime :overdue

      t.timestamps
    end
  end
end
