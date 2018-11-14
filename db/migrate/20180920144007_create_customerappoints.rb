class CreateCustomerappoints < ActiveRecord::Migration[5.2]
  def change
    create_table :customerappoints do |t|
      t.bigint :customer_id
      t.bigint :user_id
      t.bigint :appointtp_id
      t.datetime :appointtime
      t.text :summary

      t.timestamps
    end
  end
end
