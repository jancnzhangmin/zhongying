class CreatePacts < ActiveRecord::Migration[5.2]
  def change
    create_table :pacts do |t|
      t.bigint :customer_id
      t.bigint :pacttype_id
      t.string :name
      t.datetime :signtime
      t.datetime :begintime
      t.datetime :endtime
      t.string :pactnumber
      t.float :amount

      t.timestamps
    end
  end
end
